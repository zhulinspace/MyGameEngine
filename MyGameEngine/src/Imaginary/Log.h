#pragma once
#include <memory>
#include "Core.h"
#include"spdlog/spdlog.h"

//core log macros
#define IMAG_CORE_ERROR(...)	   ::Imag::Log::GetCoreLogger()->error(__VA_ARGS__)
#define IMAG_CORE_TRACE(...)     :	:Imag::Log::GetCoreLogger()->trace(__VA_ARGS__)
#define IMAG_CORE_INFO(...)       ::Imag::Log::GetCoreLogger()->info(__VA_ARGS__)
#define IMAG_CORE_WARN(...)    ::Imag::Log::GetCoreLogger()->warn(__VA_ARGS__)
#define IMAG_CORE_FATAL(...)      ::Imag::Log::GetCoreLogger()->fatal(__VA_ARGS__)


//client log macros
#define IMAG_ERROR(...)	   ::Imag::Log::GetClientLogger()->error(__VA_ARGS__)
#define IMAG_TRACE(...)     ::Imag::Log::GetClientLogger()->trace(__VA_ARGS__)
#define IMAG_INFO(...)       ::Imag::Log::GetClientLogger()->info(__VA_ARGS__)
#define IMAG_WARN(...)     ::Imag::Log::GetClientLogger()->warn(__VA_ARGS__)
#define IMAG_FATAL(...)     ::Imag::Log::GetClientLogger()->fatal(__VA_ARGS__)
namespace Imag {
	class IMAG_API Log
	{
	public:
		static void Init();
		inline static std::shared_ptr<spdlog::logger>& GetCoreLogger() { return s_CoreLogger; }
		inline static std::shared_ptr<spdlog::logger>& GetClientLogger() { return s_ClientLogger; }
	private:
		static std::shared_ptr<spdlog::logger> s_CoreLogger;
		static std::shared_ptr<spdlog::logger> s_ClientLogger;
	};

}

