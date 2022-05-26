----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:12:55 05/25/2022 
-- Design Name: 
-- Module Name:    COIN_TO_4BIT - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity COIN_TO_4BIT is
    Port ( A1 : in  STD_LOGIC;
           A2 : in  STD_LOGIC;
           A5 : in  STD_LOGIC;
           A10 : in  STD_LOGIC;
           Y : out  STD_LOGIC_VECTOR (7 downto 0));
end COIN_TO_4BIT;

architecture Behavioral of COIN_TO_4BIT is

begin
	Y(0) <= (A1 or A5) and ((not A2) and (not A10));
	Y(1) <= (A2 or A10) and ((not A1) and (not A5));
	Y(2) <= A5 and ((not A1) and (not A2) and (not A10));
	Y(3) <= A10 and ((not A1) and (not A2) and (not A5));

end Behavioral;

