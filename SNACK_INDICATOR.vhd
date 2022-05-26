----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:31:53 05/26/2022 
-- Design Name: 
-- Module Name:    SNACK_INDICATOR - Behavioral 
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

entity SNACK_INDICATOR is
    Port ( COINS : in  STD_LOGIC_VECTOR (7 downto 0);
           P1 : out  STD_LOGIC;
           P2 : out  STD_LOGIC;
           P3 : out  STD_LOGIC;
           P4 : out  STD_LOGIC);
end SNACK_INDICATOR;

architecture Behavioral of SNACK_INDICATOR is
	component SNACK_PRICE_CHECKER is
    Port ( COINS : in  STD_LOGIC_VECTOR (7 downto 0);
           SNACK : in  STD_LOGIC_VECTOR (3 downto 0);
			  ALLOW : out STD_LOGIC);
	end component;
	
	signal snack1 : STD_LOGIC_VECTOR (3 downto 0);
	signal snack2 : STD_LOGIC_VECTOR (3 downto 0);
	signal snack3 : STD_LOGIC_VECTOR (3 downto 0);
	signal snack4 : STD_LOGIC_VECTOR (3 downto 0);
begin
	snack1 <= "0001";
	snack2 <= "0010";
	snack3 <= "0100";
	snack4 <= "1000";

	A1_CHCKR: SNACK_PRICE_CHECKER port map (COINS, SNACK=>snack1, ALLOW=>P1);
	A2_CHCKR: SNACK_PRICE_CHECKER port map (COINS, SNACK=>snack2, ALLOW=>P2);
	A3_CHCKR: SNACK_PRICE_CHECKER port map (COINS, SNACK=>snack3, ALLOW=>P3);
	A4_CHCKR: SNACK_PRICE_CHECKER port map (COINS, SNACK=>snack4, ALLOW=>P4);

end Behavioral;

