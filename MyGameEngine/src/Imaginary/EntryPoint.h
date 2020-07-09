#pragma once
#ifdef IMAG_PLATFORM_WINDOWS

extern Imag::Application *Imag::CreateApplication();

int main()
{
	auto app = Imag::CreateApplication();

	app->Run();
	delete app;
}

#else
	#error Imaginary only supports Windows!
#endif
