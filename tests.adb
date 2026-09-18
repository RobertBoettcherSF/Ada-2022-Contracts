pragma Ada_2022;

with Ada.Assertions; use Ada.Assertions;
with Ada.Text_IO; use Ada.Text_IO;
with Bank_Account; use Bank_Account;

procedure Tests is
   A : Account := Open (100);
begin
   Assert (Balance_Of (A) = 100);
   Deposit (A, 50);
   Assert (Balance_Of (A) = 150);
   Put_Line ("PASS Deposit Pre/Post");

   Assert (Can_Withdraw (A, 40));
   Withdraw (A, 40);
   Assert (Balance_Of (A) = 110);
   Put_Line ("PASS Withdraw Pre/Post");

   Assert (not Can_Withdraw (A, 0));
   Assert (not Can_Withdraw (A, 1000));
   Put_Line ("PASS Can_Withdraw Post");

   --  Contract failures raise Assertion_Error when assertions are enabled.
   begin
      Deposit (A, 0);
      Assert (False, "expected Pre failure on Deposit(0)");
   exception
      when Assertion_Error =>
         Put_Line ("PASS Pre fails on Deposit(0)");
   end;

   begin
      Withdraw (A, 10_000);
      Assert (False, "expected Pre failure on overdraft");
   exception
      when Assertion_Error =>
         Put_Line ("PASS Pre fails on overdraft Withdraw");
   end;

   declare
      B : constant Account := Open;
   begin
      Assert (Balance_Of (B) = 0);
   end;
   Put_Line ("PASS Open default + Type_Invariant holds");

   Put_Line ("All Contracts topic tests passed.");
end Tests;
