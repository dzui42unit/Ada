with Ada.Containers.Vectors, Ada.Text_IO, Ada.Integer_Text_IO, Ada.Synchronous_Task_Control;
use Ada.Containers, Ada.Text_IO, Ada.Integer_Text_IO, Ada.Synchronous_Task_Control;

procedure Lab1 is

   -- N is the size of matrix
   -- matrix is a two dimensional array of integers
   -- list of function prototypes used in the program

   type matrix is array (Integer range <>, Integer range <>) of Integer;
   function GetSize return Natural;

   function GetSize return Natural is
     N : Integer;
   begin
      Put("Enter an number of elements in matrix: ");
      Get(N);
      while (N mod 4 /= 0)
      loop
         Put("N SHOULD BE DEVIDED BY 4: ");
         Get(N);
      end loop;
      return (N);
   end;

   N : Natural := GetSize;
   P : Natural := 4;
   H : Natural := N / P;

   S : Integer;

   function  CreateMatrix(N : in out Natural) return matrix;
   procedure AssignMatrix(MA : in out matrix);
   procedure PrintMatrix(MA : in matrix);

   function CreateMatrix(N : in out Natural) return matrix is
   begin
      declare
         MA : matrix(1 .. N, 1 .. N) := (others => (others => 0));
      begin
         return (MA);
      end;
   end CreateMatrix;

   MA : matrix := CreateMatrix(N);
   MB : matrix := CreateMatrix(N);
   MC : matrix := CreateMatrix(N);
   MM : matrix := CreateMatrix(N);
   MK : matrix := CreateMatrix(N);
   MC_MUL_MK : matrix := CreateMatrix(N);

   procedure AssignMatrix(MA : in out matrix) is
   begin
         for i in MA'First(1) .. MA'Last(1)
         loop
            for j in MA'First(2) .. MA'Last(2)
            loop
                Put("Enter element ");
                Put(i);
                Put(" ");
                Put(j);
                Put(" ");
                Get(MA(i, j));
            end loop;
         end loop;
   end AssignMatrix;

   procedure PrintMatrix(MA : in matrix) is
   begin
      Put_Line("MATRIX");
      for i in MA'First(1) .. MA'Last(1)
         loop
            for j in MA'First(2) .. MA'Last(2)
            loop
               Put(MA(i, j));
         end loop;
         New_Line;
      end loop;
   end PrintMatrix;

   procedure MultiplyMatrix(M1, M2 : in matrix; RES : in out matrix; S_POS, E_POS : Natural) is
   begin
      for i in M1'First(1) .. M1'Last(1)
      loop
         for j in S_POS .. E_POS
         loop
            for k in M1'First(1) .. M1'Last(1)
            loop
               RES(i, j) := RES(i,j) + M1(i, k) * M2(k, i);
            end loop;
      end loop;
   end loop;
   PrintMatrix(RES);
   end MultiplyMatrix;

   function AddMatrix(M1, M2 : in matrix; N, S_POS, E_POS : Natural) return matrix is
   begin
      declare
         RES : matrix(1 .. N, 1 .. N) := (others => (others => 0));
      begin
         for i in M1'First(1) .. M1'Last(1)
         loop
            for j in S_POS .. E_POS
            loop
               for k in M1'First(1) .. M1'Last(1)
               loop
                  RES(i, j) := RES(i,j) + M1(i, k) + M2(k, i);
               end loop;
            end loop;
         end loop;
         PrintMatrix(RES);
         return (RES);
      end;
   end AddMatrix;

   procedure MulMatrixByNumber(M1 : in out matrix; N, S_POS, E_POS : Natural; NB : Integer) is
   begin
      declare
         RES : matrix(1 .. N, 1 .. N) := (others => (others => 0));
      begin
         for i in M1'First(1) .. M1'Last(1)
         loop
            for j in S_POS .. E_POS
            loop
              M1(i, j) := M1(i, j) * NB;
            end loop;
         end loop;
         PrintMatrix(RES);
      end;
   end MulMatrixByNumber;

   Inp1, Inp2, Inp3 : Suspension_Object;

   Sem12, Sem13, Sem14 : Suspension_Object;
   Sem21, Sem23, Sem24 : Suspension_Object;
   Sem31, Sem32, Sem34 : Suspension_Object;
   Sem41, Sem42, Sem43 : Suspension_Object;

   SemCopy : Suspension_Object;

   procedure RunTasks is

      task T1;
      task T2;
      task T3;
      task T4;

      MC_MUL_MK : matrix := CreateMatrix(N);

      task body T1 is
         MC_COPY1 : matrix := CreateMatrix(N);
         MK_COPY1 : matrix := CreateMatrix(N);
      begin
         Put_Line("PROCESS T1 STARTED!");

         --Put_Line("ENTER MATRIX MB");
         --AssignMatrix(MB);

         Set_True(Inp1);

         Set_True(Sem12);
         Set_True(Sem13);
         Set_True(Sem14);

         Suspend_Until_True(Sem21);
         Suspend_Until_True(Sem31);
         Suspend_Until_True(Sem41);

         Suspend_Until_True(SemCopy);
         MK_COPY1 := MK;
         MC_COPY1 := MC;
         Set_True(SemCopy);

         Put_Line("I AM READY TO CALCULATE");

         Put_Line("PROCESS T1 FINISHED!");
      end T1;

      task body T2 is
         MC_COPY2 : matrix := CreateMatrix(N);
         MK_COPY2 : matrix := CreateMatrix(N);
      begin
         Suspend_Until_True(Inp1);

         Put_Line("PROCESS T2 STARTED");

         Set_True(Inp2);

         Set_True(Sem21);
         Set_True(Sem23);
         Set_True(Sem24);

         Suspend_Until_True(Sem12);
         Suspend_Until_True(Sem32);
         Suspend_Until_True(Sem42);

         Suspend_Until_True(SemCopy);
         MK_COPY2 := MK;
         MC_COPY2 := MC;
         Set_True(SemCopy);

         Put_Line("I AM READY TO CALCULATE");
         Put_Line("PROCESS T2 FINISHED!");
      end T2;

      task body T3 is
         MC_COPY3 : matrix := CreateMatrix(N);
         MK_COPY3 : matrix := CreateMatrix(N);
      begin
         Suspend_Until_True(Inp2);

         Put_Line("PROCESS T3 STARTED");
         Put_Line("ENTER MATRIX MK");

         AssignMatrix(MK);
         --Put_Line("ENTER MATRIX MM");
         --AssignMatrix(MM);

         Set_True(Inp3);
         Set_True(Sem31);
         Set_True(Sem32);
         Set_True(Sem34);

         Suspend_Until_True(Sem13);
         Suspend_Until_True(Sem23);
         Suspend_Until_True(Sem43);

         Suspend_Until_True(SemCopy);
         MK_COPY3 := MK;
         MC_COPY3 := MC;
         Set_True(SemCopy);

         Put_Line("I AM READY TO CALCULATE");

         Put_Line("PROCESS T3 FINISHED!");
      end T3;

      task body T4 is
         MC_COPY4 : matrix := CreateMatrix(N);
         MK_COPY4 : matrix := CreateMatrix(N);
      begin
         Suspend_Until_True(Inp3);

         Put_Line("PROCESS T4 STARTED");

         Put_Line("ENTER MATRIX MC");

         AssignMatrix(MC);
         Put("ENTER S VALUE ");
         Get(S);

         Set_True(Sem41);
         Set_True(Sem42);
         Set_True(Sem43);

         Suspend_Until_True(Sem14);
         Suspend_Until_True(Sem24);
         Suspend_Until_True(Sem34);

         Suspend_Until_True(SemCopy);
         MK_COPY4 := MK;
         MC_COPY4 := MC;
         Set_True(SemCopy);

         Put_Line("I AM READY TO CALCULATE");

         Put_Line("PROCESS T4 FINISHED!");
      end T4;

   begin
      null;
   end RunTasks;

begin
   Put_Line("Lab1 PROCESS STARTED!");
   Set_True(SemCopy);
   RunTasks;
   null;
end Lab1;
