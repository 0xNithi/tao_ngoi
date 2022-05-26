----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:53:17 05/25/2022 
-- Design Name: 
-- Module Name:    REG_PIPO_8BIT - Behavioral 
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

entity REG_PIPO_8BIT is
    Port ( CLK : in  STD_LOGIC;
           INPUT : in  STD_LOGIC_VECTOR (7 downto 0);
           OUTPUT : inout  STD_LOGIC_VECTOR (7 downto 0));
end REG_PIPO_8BIT;

architecture Behavioral of REG_PIPO_8BIT is

begin
	process (CLK)
	begin
		if (CLK'event and CLK = '0') then
			OUTPUT <= INPUT;
		end if;
	end process;
end Behavioral;

