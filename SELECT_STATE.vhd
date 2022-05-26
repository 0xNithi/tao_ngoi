----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:54:15 05/26/2022 
-- Design Name: 
-- Module Name:    SELECT_STATE - Behavioral 
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

entity SELECT_STATE is
    Port ( P : in  STD_LOGIC_VECTOR (3 downto 0);
           TRIG : in  STD_LOGIC;
           SNACK : inout  STD_LOGIC_VECTOR (3 downto 0));
end SELECT_STATE;

architecture Behavioral of SELECT_STATE is
	component REG_PIPO_4BIT is
		 port ( CLK : in  STD_LOGIC;
				  INPUT : in  STD_LOGIC_VECTOR (3 downto 0);
				  OUTPUT : inout  STD_LOGIC_VECTOR (3 downto 0));
	end component;
begin
	SEL_STATE_IC: REG_PIPO_4BIT port map(CLK=>TRIG, INPUT=>P, OUTPUT=>SNACK);

end Behavioral;

