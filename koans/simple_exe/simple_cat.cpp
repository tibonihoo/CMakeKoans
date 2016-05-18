// Part of CMakeKoans (https://github.com/tibonihoo/CMakeKoans)

#include <iostream>
#include <fstream>

int main(int argc, char* argv[])
{
	// Check correct invocation
	if (argc != 2)
	{
		std::cerr  << "Invalid number of options" << std::endl;
		std::cout << "Usage: " << argv[0] << " path_to_file_to_show_on_stout" << std::endl;
		return -1;
	}

	// Check the input file can be accessed
	std::ifstream input(argv[1]);
	if (!input.is_open())
	{
		std::cerr  << "Cannot open provided file: " << argv[1] << std::endl;
		std::cout << "Usage: " << argv[0] << " path_to_file_to_show_on_stout" << std::endl;
		return -2;
	}

	// Display "header" decoration
	for(int i=0; i<3; ++i)
	{
		for(int j=0; j<80; ++j)
			std::cout << HEADER_SYMBOL;
		std::cout << std::endl;
	}
  std::cout << std::endl;

	// Display the content of the input file
	input >> std::cout.rdbuf();
  
    std::cout << std::endl;
	// Display "header" decoration as a footer too :)
	for(int i=0; i<3; ++i)
	{
		for(int j=0; j<80; ++j)
			std::cout << HEADER_SYMBOL;
		std::cout << std::endl;
	}
  
  return 0;
}
