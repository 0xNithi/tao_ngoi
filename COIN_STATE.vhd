----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:38:21 05/25/2022 
-- Design Name: 
-- Module Name:    COIN_STATE - Behavioral 
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

entity COIN_STATE is
    Port ( A1 : in  STD_LOGIC;
           A2 : in  STD_LOGIC;
           A5 : in  STD_LOGIC;
           A10 : in  STD_LOGIC;
			  RST: in STD_LOGIC;
           TRIG : in  STD_LOGIC;
           STATE : inout  STD_LOGIC_VECTOR (7 downto 0));
end COIN_STATE;

architecture Behavioral of COIN_STATE is
	component COIN_TO_4BIT
		port ( A1 : in  STD_LOGIC;
			  A2 : in  STD_LOGIC;
			  A5 : in  STD_LOGIC;
			  A10 : in  STD_LOGIC;
			  Y : out  STD_LOGIC_VECTOR (7 downto 0));
	end component;

	component FULL_ADDER_8BIT
		port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           Sum : out  STD_LOGIC_VECTOR (7 downto 0));
	end component;
	
	component REG_PIPO_8BIT
		port ( CLK : in  STD_LOGIC;
           INPUT : in  STD_LOGIC_VECTOR (7 downto 0);
           OUTPUT : inout  STD_LOGIC_VECTOR (7 downto 0));
	end component;
	
	signal CNVT_TO_ADDER : STD_LOGIC_VECTOR (7 downto 0);
	signal ADDR_OUTPUT : STD_LOGIC_VECTOR (7 downto 0);
	signal STATE_INPUT : STD_LOGIC_VECTOR (7 downto 0);
begin
	process (RST, ADDR_OUTPUT)
	begin
		if RST='1' then
			STATE_INPUT <= "00000000";
		else
			STATE_INPUT <= ADDR_OUTPUT;
		end if;
	end process;

	CNVTR_IC: COIN_TO_4BIT port map (A1, A2, A5, A10, Y=>CNVT_TO_ADDER);
	ADDR_IC: FULL_ADDER_8BIT port map (A=>CNVT_TO_ADDER, B=>STATE, Sum=>ADDR_OUTPUT);
	STATE_IC: REG_PIPO_8BIT port map (CLK=>TRIG, INPUT=>STATE_INPUT, OUTPUT=>STATE);
end Behavioral;

