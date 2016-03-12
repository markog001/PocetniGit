-------------------------------------------------------------------------------
--  Odsek za racunarsku tehniku i medjuracunarske komunikacije
--  Autor: LPRS2  <lprs2@rt-rk.com>                                           
--                                                                             
--  Ime modula: timer_counter                                                           
--                                                                             
--  Opis:                                                               
--                                                                             
--    Modul broji sekunde i prikazuje na LED diodama                                         
--                                                                             
-------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY timer_counter IS PORT (
                               clk_i     : IN STD_LOGIC; -- ulazni takt
                               rst_i     : IN STD_LOGIC; -- reset signal 
                               one_sec_i : IN STD_LOGIC; -- signal koji predstavlja proteklu jednu sekundu vremena 
                               cnt_en_i  : IN STD_LOGIC; -- signal dozvole brojanja                              
                               cnt_rst_i : IN STD_LOGIC; -- signal resetovanja brojaca (clear signal)
										 bt_min_i  : IN STD_LOGIC;
										 bt_hour_i : IN STD_LOGIC;
                               led_o     : OUT STD_LOGIC_VECTOR(7 DOWNTO 0) -- izlaz ka led diodama
                             );
END timer_counter;

ARCHITECTURE rtl OF timer_counter IS

component reg
	generic(
		WIDTH    : positive := 1;
		RST_INIT : integer := 0
	);
	port(
		i_clk  : in  std_logic;
		in_rst : in  std_logic;
		i_d    : in  std_logic_vector(WIDTH-1 downto 0);
		o_q    : out std_logic_vector(WIDTH-1 downto 0)
	);
end component;


SIGNAL counter_value_r : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL min_value_r : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL hour_value_r : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal sClk : std_logic;
signal sRst : std_logic;
signal muxSecOut : std_logic_vector(7 downto 0);
signal muxCntSecOut : std_logic_vector(7 downto 0);
signal muxMinOut : std_logic_vector(7 downto 0);
signal muxCntMinOut : std_logic_vector(7 downto 0);
signal muxHourOut : std_logic_vector(7 downto 0);
signal muxCntHourOut : std_logic_vector(7 downto 0);
signal mux60SecOut : std_logic_vector(7 downto 0);
signal mux60MinOut : std_logic_vector(7 downto 0);
signal sBtnVect : std_logic_vector(1 downto 0);
signal oneMin : std_logic;
signal oneHour : std_logic;

BEGIN

-- DODATI :
-- brojac koji na osnovu izbrojanih sekundi pravi izlaz na LE diode
	sBtnVect <= bt_hour_i & bt_min_i;
	led_o <= counter_value_r when sBtnVect = "00"
	else min_value_r when sBtnVect = "01"
	else hour_value_r when sBtnVect = "10"
	else hour_value_r;
	
	sRst <= not rst_i;
	sClk <= clk_i;
	
	muxSecOut <= mux60SecOut when cnt_rst_i = '0'
	else (others => '0');
	
-- provera da li je protekla sekunda
	muxCntSecOut <= counter_value_r + 1 when one_sec_i = '1'
	else counter_value_r;
	
-- provera da li je proteklo 60 sekundi
	mux60SecOut <= muxCntSecOut when counter_value_r < 59
	else (others => '0');
	
	oneMin <= '1' when counter_value_r = 59
	else '0';
	
-------------------------------------------------------------------------
	
	muxMinOut <= mux60MinOut when cnt_rst_i = '0'
	else (others => '0');
	
-- provera da li je proteklo minut
	muxCntMinOut <= min_value_r + 1 when oneMin = '1'
	else min_value_r;
	
-- provera da li je proteklo 60 minuita
	mux60MinOut <= muxCntMinOut when min_value_r < 59
	else (others => '0');
	
	oneHour <= '1' when min_value_r = 59
	else '0';
	
-------------------------------------------------------------------------
	
	muxHourOut <= muxCntHourOut when cnt_rst_i = '0'
	else (others => '0');
	
-- provera da li je protekao sat
	muxCntHourOut <= hour_value_r + 1 when oneHour = '1'
	else hour_value_r;
	
	
	
	secReg : reg generic map(
		WIDTH => 8,
		RST_INIT => 0
	)
	port map(
		i_clk => sClk,
		in_rst => sRst,
		i_d => muxSecOut,
		o_q => counter_value_r
	);
	
	minReg : reg generic map(
		WIDTH => 8,
		RST_INIT => 0
	)
	port map(
		i_clk => sClk,
		in_rst => sRst,
		i_d => muxMinOut,
		o_q => min_value_r
	);
	
	hourReg : reg generic map(
		WIDTH => 8,
		RST_INIT => 0
	)
	port map(
		i_clk => sClk,
		in_rst => sRst,
		i_d => muxHourOut,
		o_q => hour_value_r
	);
	


END rtl;