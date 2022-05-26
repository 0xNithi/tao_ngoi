----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:14:27 05/26/2022 
-- Design Name: 
-- Module Name:    BUY_UNIT - Behavioral 
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

entity BUY_UNIT is
    Port ( COINS : in  STD_LOGIC_VECTOR (7 downto 0);
           SEL : in  STD_LOGIC_VECTOR (3 downto 0);
           CONFIRM : in  STD_LOGIC;
           MOTOR : out  STD_LOGIC_VECTOR (3 downto 0));
end BUY_UNIT;

architecture Behavioral of BUY_UNIT is
	component SNACK_PRICE_CHECKER is
		Port ( COINS : in  STD_LOGIC_VECTOR (7 downto 0);
				SNACK : in  STD_LOGIC_VECTOR (3 downto 0);
				ALLOW : out STD_LOGIC);
	end component;
	
	signal ALLOW_TO_BUY : STD_LOGIC;
begin
	process (COINS, SEL, CONFIRM)
	begin
		if (CONFIRM='0') then
			MOTOR <= "0000";
		else
			if ALLOW_TO_BUY = '1' then
				MOTOR <= SEL;
			end if;
		end if;
	end process;
	
	CHCKR: SNACK_PRICE_CHECKER port map(COINS, SNACK=>SEL, ALLOW=>ALLOW_TO_BUY);

end Behavioral;

