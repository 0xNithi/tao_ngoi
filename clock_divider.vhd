library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.add;

entity clock_divider is
	port(
		period : in integer;
		clk, reset : in  std_logic;
		clk_out : out std_logic
	);
end clock_divider;

architecture behavioral of clock_divider is

signal count : integer := 1;
signal tmp : std_logic := '0';

begin
	process(clk, reset)
	begin
		if reset = '1' then
			count <= 1;
			tmp <= '0';
		elsif clk'event and clk = '1' then
			count <= count + 1;
			if count = period then
				tmp <= not tmp;
				count <= 1;
			end if;
		end if;
		clk_out <= tmp;
	end process;
end behavioral;