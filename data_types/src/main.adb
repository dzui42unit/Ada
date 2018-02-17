with Ada.Float_Text_IO, Ada.Integer_Text_IO;
use Ada.Float_Text_IO, Ada.Integer_Text_IO;

procedure Main is

   -- the operations should be performed for the variables of the same type
   -- float demo procedure
   -- Float(I) converts Integer to the Float Type

   procedure Float_Demo is

      A, B : Float := 0.0;
      I, J : Integer := 1;

   begin

      A := B + 7.0;
      Put(A);
      I := J * 3;
      Put(I);
      B := Float(I) + A;
      Put(B);

   end;

   -- user defined types and subtypes

   type Count is range 0 .. 99_999;
   subtype Widget_Count is Count range 0 .. 99;
   subtype Egg_Count is Count;

   -- enumeration

   type Day is (Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday);
   subtype Weekday is Day range Monday .. Friday;
   subtype Weekend is Day range Saturday .. Sunday;

   Today : Day := Tuesday;

   -- arrays

   type table is array (1 .. 100) of Integer;
   type grid is array (-100 .. 100, -100 .. 100) of Float;

   Ar1d : table;
   Ar2d : grid;

   -- records

   type Date is
      record
         Day : Integer range 1 .. 31;
         Month : Integer range 1 .. 12;
         Year : Integer range 1 .. 4000 := 1995;
      end record;

   BDay : Date;

begin
   Float_Demo;

   Ar1d(1) := 1;
   Ar2d(1,1) := 666.666;


   BDay.Day := 12;
   BDay.Month := 10;
   BDay.Year := 1815;

   null;
end Main;
