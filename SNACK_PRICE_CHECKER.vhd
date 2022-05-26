----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:02:00 05/25/2022 
-- Design Name: 
-- Module Name:    SNACK_PRICE_CHECKER - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SNACK_PRICE_CHECKER is
    Port ( COINS : in  STD_LOGIC_VECTOR (7 downto 0);
           SNACK : in  STD_LOGIC_VECTOR (3 downto 0);
			  ALLOW : out STD_LOGIC);
end SNACK_PRICE_CHECKER;

architecture Behavioral of SNACK_PRICE_CHECKER is

signal coins_value : integer range 255 downto 0;

begin
	process (COINS, SNACK)
		begin
			coins_value <= to_integer(unsigned(COINS));
			ALLOW <= '0';
			if SNACK="0001" then
				if coins_value >= 5 then
					ALLOW <= '1';
				end if;
			elsif SNACK="0010" then
				if coins_value >= 10 then
					ALLOW <= '1';
				end if;
			elsif SNACK="0100" then
				if coins_value >= 10 then
					ALLOW <= '1';
				end if;
			elsif SNACK="1000" then
				if coins_value >= 20 then
					ALLOW <= '1';
				end if;
			end if;
		end process;

end Behavioral;

