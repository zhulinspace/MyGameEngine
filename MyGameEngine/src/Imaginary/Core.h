#pragma once

#ifdef IMAG_PLATFORM_WINDOWS
	#ifdef IMAG_BUILD_DLL
		#define IMAG_API __declspec(dllexport)
	#else
		#define IMAG_API __declspec(dllimport)
	#endif
#else
	#error Imaginary only supports Windows!
#endif