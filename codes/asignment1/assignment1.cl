class Stack {
  isNil() : Bool { true };
  top()  : String { { abort(); "0"; } };
  tail()  : Stack { { abort(); self; } };
  cons(i : String) : Stack {
    (new StackItem).init(i, self)
  };
};

class StackItem inherits Stack {
   value : String;	-- The element in this stack item
   down : Stack;	-- The rest of the stack
   isNil() : Bool { false };
   top()  : String { value };
   tail()  : Stack { down };
   init(i : String, rest : Stack) : Stack {
      {
	       value <- i;
	       down <- rest;
	       self;
      }
   };
};

class Main inherits IO {
   myStack           : Stack;
   loopVariable      : Bool;
   command           : String;
   converter         : A2I;
   top1              : String;
   top2              : String;
   stackTop          : String;


   printStack(l : Stack) : Object {
      if l.isNil() then
        out_string("\n")
      else {
			   out_string(l.top());
			   out_string(" ");
			   printStack(l.tail());
		  }
      fi
   };

   main() : Object {
      {
        myStack <- new Stack;
        loopVariable <- true;
        converter <- new A2I;

	      while (loopVariable) loop {
          out_string("> ");
          command <- in_string();

          if command = "x" then
            loopVariable <- false
          else
            if command = "e" then {
              stackTop <- myStack.top();
              myStack <- myStack.tail();
    					if stackTop = "+" then {
    							top1 <- myStack.top();
    							top2 <- myStack.tail().top();
                  myStack <- myStack.tail().tail().cons(converter.i2a(converter.a2i(top1) + converter.a2i(top2)));
    					} else
                if stackTop = "s" then {
                  top1 <- myStack.top();
    							top2 <- myStack.tail().top();
                  myStack <- myStack.tail().tail().cons(top1).cons(top2);
                } else
                  myStack <- myStack.cons(stackTop)
                fi
    					fi;
            } else
              if command = "d" then
                printStack(myStack)
              else
                myStack <- myStack.cons(command)
              fi
            fi
          fi;
	      } pool;
      }

   };

};
