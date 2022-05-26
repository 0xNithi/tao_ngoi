----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:15:03 05/25/2022 
-- Design Name: 
-- Module Name:    ADDER_8BIT - Behavioral 
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

entity FULL_ADDER_8BIT is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           Sum : out  STD_LOGIC_VECTOR (7 downto 0));
end FULL_ADDER_8BIT;

architecture Behavioral of FULL_ADDER_8BIT is
	component FULL_ADDER_1BIT
		port (A, B, Cin: in STD_LOGIC;
				Cout, Sum: out STD_LOGIC);
	end component;
	signal C_tmp: STD_LOGIC_VECTOR (8 downto 0);
begin
	ADDN_GEN : for I in 7 downto 0 generate
		ADDN_BIT : FULL_ADDER_1BIT
						port map (A(I), B(I), C_tmp(I), C_tmp(I + 1), Sum(I));
					end generate;

end Behavioral;

