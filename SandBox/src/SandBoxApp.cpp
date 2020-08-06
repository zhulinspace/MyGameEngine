
#include"imgpch.h"
#include "Imag.h"


class SandBox : public Imag::Application
{
public:
	SandBox()
	{

	}
	~SandBox()
	{

	}
};

Imag::Application * Imag::CreateApplication()
{
	return new SandBox();
}