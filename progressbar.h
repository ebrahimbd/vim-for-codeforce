#include <iostream>
#include <unistd.h>

class ProgressBar {
	private:
	int _emptyVal, _fullVal, _increments;
	int _currentVal;
	bool _full=false;

	public:
	ProgressBar(int emptyVal, int fullVal, int incr);
	void reset();
	void update();
	void test();
};


ProgressBar::ProgressBar(int emptyVal=0, int fullVal=100, int incr=1)
{
	if(fullVal<=emptyVal || incr<1 || incr>fullVal-emptyVal)
	{
		std::cerr<<"Incorrect values to progressbar.\n";
	}
	else
	{
		_emptyVal = emptyVal;
		_fullVal = fullVal;
		_increments = incr;
		_currentVal = _emptyVal;
	}
}

void ProgressBar::reset()
{
	_currentVal = _emptyVal;
	_full = false;
}

void ProgressBar::update()
{
	if(!_full)
	{
		_currentVal +=  _increments;
		if(_currentVal>_fullVal)
			_currentVal = _fullVal;
		std::cout<<"[";
		for(int i=_emptyVal; i<_currentVal; i+=_increments)
		{
			std::cout<<'*';
		}
		if(_currentVal<_fullVal)
			std::cout<<"]> "<<_currentVal<<"/"<<_fullVal<<"\r";
		else
		{
			std::cout<<"]> Done.\r\n";
			_full = true;
		}
		std::cout.flush();
	}	
}

void ProgressBar::test()
{
	update();
	sleep(1);
	for(int i=_emptyVal; i<_fullVal; i+=_increments)
	{
		update();
		usleep(6000);
	}
}
