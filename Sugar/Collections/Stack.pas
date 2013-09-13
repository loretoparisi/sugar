﻿namespace RemObjects.Oxygene.Sugar.Collections;

{$HIDE W0} //supress case-mismatch errors

interface

type
  {$IF ECHOES OR COOPER}
  Stack<T> = public class mapped to {$IF ECHOES}System.Collections.Generic.Stack<T>{$ELSE}java.util.Stack<T>{$ENDIF}
  public
    method Contains(Item: T): Boolean; mapped to Contains(Item);
    method Clear; mapped to Clear;
    method Peek: T; mapped to Peek;
    method Pop: T; mapped to Pop;
    method Push(Item: T); mapped to Push(Item);
    method ToArray: array of T; mapped to ToArray;

    property Count: Integer read {$IF ECHOES}mapped.Count{$ELSE}mapped.size{$ENDIF};
  end;
  {$ELSEIF NOUGAT}
  Stack<T> = public class mapped to Foundation.NSMutableArray
  public
    method Contains(Item: T): Boolean; mapped to containsObject(Item);
    method Clear; mapped to removeAllObjects;
    method Peek: T; mapped to lastObject;
    method Pop: T;
    method Push(Item: T); mapped to addObject(Item);
    method ToArray: array of T;

    property Count: Integer read mapped.count;
  end;
  {$ENDIF}

implementation

{$IF NOUGAT}
method Stack<T>.Pop: T;
begin
  result := mapped.lastObject;
  mapped.removeLastObject;
end;

method Stack<T>.ToArray: array of T;
begin
  result := new T[mapped.count];
  for i: Integer := mapped.count - 1 downto 0 do
    result := mapped.objectAtIndex(i);
end;
{$ENDIF}

end.
