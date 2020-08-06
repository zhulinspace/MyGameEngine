workspace "MyGameEngine"
		architecture "x64"

		configurations
		{
			"Debug",
			"Release",
			"Dist"
		}
outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "MyGameEngine"
		location "MyGameEngine"
		kind "SharedLib"
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
			"%{prj.name}/vendor/spdlog/include"
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