#pragma once

#ifdef IMAG_PLATFORM_WINDOWS

extern Imag::Application *Imag::CreateApplication();

int main()
{
	Imag::Log::Init();
	IMAG_CORE_WARN("initialized log");
	int a = 3;
	IMAG_INFO("hello var={0}",a);

	auto app = Imag::CreateApplication();
	app->Run();
	delete app;
}

#else
	#error Imaginary only supports Windows!
#endif
