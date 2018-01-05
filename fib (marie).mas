JnS _main
Halt

_main, DEC 0
	Input
	Store Counter
	JnS _fib
    	Jns _PopStack
	Load tmp_stack
    	Output
	JumpI _main


// -- Calculation Functions --

_checkZeroOneTwo, HEX 0
	Load Counter
	Skipcond 800
	JnS _fibZeroOrLess // if input <= 0 (though techincally impossible to less than)
	Subt One // if input > 0
	Skipcond 400
    	Subt One // if input > 1
    	Skipcond 800 // if input = 1
	JnS _fibOneTwo // if input = 1,2
	JumpI _checkZeroOneTwo // if input > 2

_fib, HEX 0
	// Initialise Stack First Two Values
	Load One
    	Store tmp_stack
	JnS _PushStack
	Load One
    	Store tmp_stack
	JnS _PushStack

	// Check Input
	JnS _checkZeroOneTwo

    	Load Counter
	Subt Two
    	Store Counter

	// Calc fibN if input > 0
	JnS _fibN

_fibZeroOrLess, HEX 0
	Clear
	JumpI _fib

_fibOneTwo, HEX 0
	Load One
	JumpI _fib

_fibN, HEX 0
	// Pop top to values and store.
	JnS _PopStack
    	Load tmp_stack
	Store tmp_fibA
	JnS _PopStack
    	Load tmp_stack
	Store tmp_fibB

	// Add the two stored values
	Load tmp_fibA
	Add tmp_fibB
	Store tmp_fibB
	Load tmp_fibA
    	Store tmp_stack
    
    	// Push updated values back to stack
	JnS _PushStack
	Load tmp_fibB
    	Store tmp_stack
	JnS _PushStack

	// Check remaining iterations
	Load Counter
	Subt One
	Store Counter
	Skipcond 400
	JnS _fibN
	JumpI _fib


// -- Stack Functions --

_PushStack, HEX 0
	Load tmp_stack
	StoreI StackPointer
	Load StackPointer
	Subt One
	Store StackPointer
	JumpI _PushStack

_PopStack, HEX 0
	Load StackPointer
	Add One
    	Store StackPointer
	LoadI StackPointer
	Store tmp_stack
	JumpI _PopStack
    

// -- Variables --

Counter, HEX 0
StackPointer, HEX FFF
One, DEC 1
Two, DEC 2
Three, DEC 3

tmp_stack, HEX 0 // for giving and receiving values from the stack

tmp_fibA, HEX 0
tmp_fibB, HEX 0
