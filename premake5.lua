workspace "MyGameEngine"
		architecture "x64"

		configurations
		{
			"Debug",
			"Release",
			"Dist"
		}
outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

-- Include directories relative to root folder (solution directory)
IncludeDir = {}
IncludeDir["GLFW"] = "MyGameEngine/vendor/GLFW/include"
--IncludeDir["Glad"] = "MyGameEngine/vendor/Glad/include"
--IncludeDir["ImGui"] = "MyGameEngine/vendor/imgui"
--IncludeDir["glm"] = "MyGameEngine/vendor/glm"
--IncludeDir["stb_image"] = "MyGameEngine/vendor/stb_image"
--IncludeDir["entt"] = "MyGameEngine/vendor/entt/include"

include "MyGameEngine/vendor/GLFW" --include premake file in glfw
--group "Dependencies"
--	include "Hazel/vendor/GLFW"
--	include "Hazel/vendor/Glad"
--	include "Hazel/vendor/imgui"
--group ""

project "MyGameEngine"
		location "MyGameEngine"
		kind "SharedLib"
		language "C++"

		targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

		pchheader "imgpch.h"
		pchsource "MyGameEngine/src/imgpch.cpp"

		files
		{
			"%{prj.name}/src/**.h",
			"%{prj.name}/src/**.cpp",
		}

		includedirs
		{
			"%{prj.name}/src",
			"%{prj.name}/vendor/spdlog/include",
			"%{IncludeDir.glfw}"
		}

		links
		{
			"GLFW",
			"opengl32.lib"
		}

		filter "system:windows"
			cppdialect "C++17"
			staticruntime "On"
			systemversion "latest"

			defines
			{
					"IMAG_PLATFORM_WINDOWS",
					"IMAG_BUILD_DLL",
			}

			postbuildcommands
			{
					("{copy} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/SandBox")
			}

		filter "configurations:Debug"
			defines "IMAG_DEBUG"
			runtime "Debug"
			symbols "on"

		filter "configurations:Release"
			defines "IMAG_RELEASE"
			runtime "Release"
			optimize "on"

		filter "configurations:Dist"
			defines "IMAG_DIST"
			runtime "Release"
			optimize "on"

project "SandBox"
	location "SandBox"
	kind "ConsoleApp"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp",

	}

	includedirs
	{
		"MyGameEngine/vendor/spdlog/include",
		"MyGameEngine/src"
	}

	links
	{
		"MyGameEngine"
	}

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"

		defines
		{
				"IMAG_PLATFORM_WINDOWS",
		}

	
	filter "configurations:Debug"
		defines "IMAG_DEBUG"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		defines "IMAG_RELEASE"
		runtime "Release"
		optimize "on"

	filter "configurations:Dist"
		defines "IMAG_DIST"
		runtime "Release"
		optimize "on"