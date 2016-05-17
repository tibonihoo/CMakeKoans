// Part of CMakeKoans (https://github.com/tibonihoo/CMakeKoans)


#include <prettify.h>
#include <sstream>

namespace cmake_koans
{
	std::string prettify_line(const std::string& text)
	{
		std::ostringstream os;
		os << "* " << text << " *" << std::endl << std::endl;
		return os.str();
	}
}

