#include"imgpch.h"

#include "Application.h"
#include"Imaginary/Events/ApplicationEvent.h"
#include"Imaginary/Log.h"
Imag::Application::Application()
{
}

Imag::Application::~Application()
{
}


void Imag::Application::Run()
{
	WindowResizeEvent e(1280, 720);
	if (e.IsInCategory(EventCategoryApplication))
	{
		IMAG_TRACE(e);
	}
	else {

	}
	while (true);
	
}
