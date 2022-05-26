----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:02:55 05/26/2022 
-- Design Name: 
-- Module Name:    TAO_NGOI - Behavioral 
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
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TAO_NGOI is
    Port ( A1 : in  STD_LOGIC;
           A2 : in  STD_LOGIC;
           A5 : in  STD_LOGIC;
           A10 : in  STD_LOGIC;
           COIN_TRIG : in  STD_LOGIC;
           SNACK : in  STD_LOGIC_VECTOR (3 downto 0);
           SNACK_TRIG : in  STD_LOGIC;
           CONFIRM : in  STD_LOGIC;
           MOTOR : inout  STD_LOGIC_VECTOR (3 downto 0);
           COIN_STATE_IND : out  STD_LOGIC_VECTOR (7 downto 0);
           SEL_STATE : inout  STD_LOGIC_VECTOR (3 downto 0);
           SNACK_IND_1 : out  STD_LOGIC;
			  SNACK_IND_2 : out  STD_LOGIC;
			  SNACK_IND_3 : out  STD_LOGIC;
			  SNACK_IND_4 : out  STD_LOGIC;
			  clk : in std_logic;
			  seven_segment : out std_logic_vector(6 downto 0);
			  select_display : out std_logic_vector(2 downto 0));
end TAO_NGOI;

architecture Behavioral of TAO_NGOI is
	component COIN_STATE is
		port ( A1 : in  STD_LOGIC;
           A2 : in  STD_LOGIC;
           A5 : in  STD_LOGIC;
           A10 : in  STD_LOGIC;
			  RST: in STD_LOGIC;
           TRIG : in  STD_LOGIC;
           STATE : inout  STD_LOGIC_VECTOR (7 downto 0));
	end component;
	
	component SELECT_STATE is
		port ( P : in  STD_LOGIC_VECTOR (3 downto 0);
           TRIG : in  STD_LOGIC;
           SNACK : inout  STD_LOGIC_VECTOR (3 downto 0));
	end component;
	
	component BUY_UNIT is
		port ( COINS : in  STD_LOGIC_VECTOR (7 downto 0);
           SEL : in  STD_LOGIC_VECTOR (3 downto 0);
           CONFIRM : in  STD_LOGIC;
           MOTOR : inout  STD_LOGIC_VECTOR (3 downto 0));
	end component;

	component SNACK_INDICATOR is
		 Port ( COINS : in  STD_LOGIC_VECTOR (7 downto 0);
				  P1 : out  STD_LOGIC;
				  P2 : out  STD_LOGIC;
				  P3 : out  STD_LOGIC;
				  P4 : out  STD_LOGIC);
	end component;
	
	component binary_bcd_converter
		generic(N: positive := 8);
		port(
			clk, reset: in std_logic;
			binary_in: in std_logic_vector(N-1 downto 0);
			bcd0, bcd1, bcd2, bcd3, bcd4: out std_logic_vector(3 downto 0)
		);
	end component;
	
	component bcd_7segment
		port(
			bcd_in : in std_logic_vector(3 downto 0);
			seven_segment : out std_logic_vector(6 downto 0)
		);
	end component;

	component clock_divider
		port(
			period : in integer;
			clk, reset : in  std_logic;
			clk_out : out std_logic
		);
	end component;

	signal COIN_STATE_OUT_WIRE : STD_LOGIC_VECTOR (7 downto 0);
	signal COIN_STATE_RST_WIRE : STD_LOGIC;
	signal SEL_STATE_WIRE : STD_LOGIC_VECTOR (3 downto 0);
	signal COIN_STATE_TRIG_SIG : STD_LOGIC;
	
	signal clk_1khz : std_logic := '0';
	signal bcd0, bcd1 : std_logic_vector(3 downto 0);
	signal bcd_in : std_logic_vector(3 downto 0);
begin
	COIN_STATE_RST_WIRE <= MOTOR(0) or MOTOR(1) or MOTOR(2) or MOTOR(3);
	COIN_STATE_TRIG_SIG <= COIN_TRIG or CONFIRM;

	COIN_STATE_IC : COIN_STATE port map (
		A1, A2, A5, A10, RST=>COIN_STATE_RST_WIRE, TRIG=>COIN_STATE_TRIG_SIG, STATE=>COIN_STATE_OUT_WIRE
	);
	
	COIN_STATE_IND <= COIN_STATE_OUT_WIRE;
	
	SELECT_STATE_IC : SELECT_STATE port map (
		P=>SNACK, TRIG=>SNACK_TRIG, SNACK=>SEL_STATE
	);
	
	BUY_UNIT_IC : BUY_UNIT port map (
		COINS=>COIN_STATE_OUT_WIRE, SEL=>SEL_STATE, CONFIRM=>CONFIRM, MOTOR=>MOTOR
	);
	
	SNACK_INDICATOR_IC : SNACK_INDICATOR port map (
		COINS=>COIN_STATE_OUT_WIRE, P1=>SNACK_IND_1, P2=>SNACK_IND_2, P3=>SNACK_IND_3, P4=>SNACK_IND_4
	);
	
	bbc: binary_bcd_converter port map(
		clk => clk_1khz,
		reset => '0',
		binary_in => COIN_STATE_OUT_WIRE,
		bcd0 => bcd0,
		bcd1 => bcd1
	);
	
	b7: bcd_7segment port map(
		bcd_in => bcd_in,
		seven_segment => seven_segment
	);
	
	cd0: clock_divider port map(
		period => 20000,
		clk => clk,
		reset => '0',
		clk_out => clk_1khz
	);
	
	process(clk_1khz)
	
		variable display_selection : std_logic_vector(1 downto 0);
		
	begin
		
		if clk_1khz'event and clk_1khz = '1' then
			case display_selection is
				when "00" =>
					select_display <= "110";
					bcd_in <= bcd0;
				when "01" =>
					select_display <= "101";
					bcd_in <= bcd1;
				when others =>
					select_display <= "011";
					case SEL_STATE is
						when "0001" =>
							bcd_in <= "0001";
						when "0010" =>
							bcd_in <= "0010";
						when "0100" =>
							bcd_in <= "0011";
						when "1000" =>
							bcd_in <= "0100";
						when others =>
							bcd_in <= "0000";
					end case;
			end case;
			display_selection := display_selection + '1';
		end if;

	end process;

end Behavioral;

