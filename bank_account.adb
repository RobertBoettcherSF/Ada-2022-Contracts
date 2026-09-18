pragma Ada_2022;

package body Bank_Account is

   function Open (Initial : Credit := 0) return Account is
   begin
      return (Balance => Initial);
   end Open;

   procedure Deposit (A : in out Account; Amount : Credit) is
   begin
      A.Balance := A.Balance + Amount;
   end Deposit;

   procedure Withdraw (A : in out Account; Amount : Credit) is
   begin
      A.Balance := A.Balance - Amount;
   end Withdraw;

   function Can_Withdraw (A : Account; Amount : Credit) return Boolean is
   begin
      return Amount > 0 and then Amount <= A.Balance;
   end Can_Withdraw;

end Bank_Account;
