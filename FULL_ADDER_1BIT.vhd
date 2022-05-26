----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:25:34 05/25/2022 
-- Design Name: 
-- Module Name:    FULL_ADDER_1BIT - Behavioral 
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

entity FULL_ADDER_1BIT is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Cin : in  STD_LOGIC;
           Cout : out  STD_LOGIC;
           Sum : out  STD_LOGIC);
end FULL_ADDER_1BIT;

architecture Behavioral of FULL_ADDER_1BIT is
	signal X : STD_LOGIC_VECTOR(2 downto 0);
begin
	X <= A&B&Cin;
	Sum <= '1' when (X="001" or X="010" or X="100" or X="111") else
			'0';
	Cout <= '1' when (X="011" or X="101" or X="110" or X="111") else
			'0';

end Behavioral;

