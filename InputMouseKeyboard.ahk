InputMouseKeyboard(_fmt := 0, _md := "vk", _tmo := 0)
{
	; _fmt (Format):
	;   0 - Return KeyName
	;   1 - Return VK or SC (Hexadecimal)
	;   2 - Return Code (Decimal)
	;
	; _md (Mode):
	;   "vk" - VK (Virtual KeyCode)
	;   "sc" - SC (Scan Code)
	;
	; _tmo (TimeOut):
	;   0 - Ilimited
	;   1 or more - Count the seconds until you reach the same value

	if(_md <> "vk" && _md <> "sc")
	{
		_md := "vk"
	}
	sec := A_Sec, cou := 0, _cd := 1
	Loop
	{
		if(sec <> A_Sec && _tmo > 0)
		{
			Tooltip % "Count: " cou "`nSec: " sec "`nTimeout: " _tmo "`n_r: " _r
			cou++
			if(cou > _tmo)
			{
				 _r := 0
				 break
			}
			sec := A_Sec
		}
		; Ignore Common Shift, Control and Alt, working just with L or R
		if(_cd < 16 || _cd > 18)
		{
			_hx := Format(_md "{:x}", _cd)
		}
		if(GetKeyState(_hx) > 0)
		{
			_r := GetKeyName(_hx)
			if(StrLen(_r) == 1)
			{
				StringUpper, _r, _r
			}
			if(_fmt == 1)
			{
				_r := _hx
			}
			if(_fmt == 2)
			{
				_r := A_Index
			}
			break
		}
		_cd++
		if(_cd > 256)
		{
			_cd := 1
		}
	}
	return _r
}