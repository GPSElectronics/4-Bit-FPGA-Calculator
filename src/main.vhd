library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;

entity main is
    port(
        a_in : in STD_LOGIC_VECTOR (3 downto 0);
        b_in : in STD_LOGIC_VECTOR (3 downto 0);
        operation : in STD_LOGIC_VECTOR (1 downto 0);
        clk : in STD_LOGIC;
        btn : in STD_LOGIC;
        segments : out STD_LOGIC_VECTOR (6 downto 0); -- A through G segments
        anodes  : out STD_LOGIC_VECTOR (3 downto 0);  -- 4 Digit selectors
        led_0 : out STD_LOGIC;
        led_1 : out STD_LOGIC
   );
end main;

architecture RTL of main is
    component ALU_Brain is
        Port(
           a_in : in STD_LOGIC_VECTOR (3 downto 0);
           b_in : in STD_LOGIC_VECTOR (3 downto 0);
           operation : in STD_LOGIC_VECTOR (1 downto 0);
           result : out STD_LOGIC_VECTOR (4 downto 0);
           led_0 : out STD_LOGIC;
           led_1 : out STD_LOGIC
        );
    end component;

    component SegmentDisplay_3 is
        Port(
           digit_4 : in STD_LOGIC_VECTOR (3 downto 0); -- Tens B
           digit_3 : in STD_LOGIC_VECTOR (3 downto 0); -- Ones B
           digit_2 : in STD_LOGIC_VECTOR (3 downto 0); -- Tens A
           digit_1 : in STD_LOGIC_VECTOR (3 downto 0); -- Ones A
           clk : in STD_LOGIC;
           segments_out : out STD_LOGIC_VECTOR (6 downto 0);
           anodes : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;

    component BCD_converter is
        Port(
            binary_in : in STD_LOGIC_VECTOR (4 downto 0);
            ones_digit : out STD_LOGIC_VECTOR(3 downto 0);
            tens_digit : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;

    signal wire_bcd_0 : UNSIGNED(3 downto 0);
    signal wire_bcd_1 : UNSIGNED(3 downto 0);
    signal wire_bcd_2 : UNSIGNED(3 downto 0);
    signal wire_bcd_3 : UNSIGNED(3 downto 0);
    signal s_result : STD_LOGIC_VECTOR(4 downto 0);
    signal s_result_tens : STD_LOGIC_VECTOR(3 downto 0);
    signal s_result_ones : STD_LOGIC_VECTOR(3 downto 0);
    signal a_in_tens : STD_LOGIC_VECTOR(3 downto 0);
    signal a_in_ones : STD_LOGIC_VECTOR(3 downto 0);
    signal b_in_tens : STD_LOGIC_VECTOR(3 downto 0);
    signal b_in_ones : STD_LOGIC_VECTOR(3 downto 0);
    signal current_button : STD_LOGIC := '0';
    signal button_detection : STD_LOGIC := '0';
    signal past_button : STD_LOGIC := '0';
    signal show_result : STD_LOGIC := '0';
    signal s_led_0 : STD_LOGIC := '0';
    signal s_led_1 : STD_LOGIC := '0';
     --DEBOUNCER
    signal debounce_counter : INTEGER := 0;
    signal stable_button : STD_LOGIC := '0';

begin
    Brain : ALU_Brain
    port map (
        a_in => a_in,
        b_in => b_in,
        operation => operation,
        result => s_result,
        led_0 => s_led_0,
        led_1 => s_led_1
    );

    Segment_Chip : SegmentDisplay_3
     port map(
        digit_4 => STD_LOGIC_VECTOR(wire_bcd_3),
        digit_3 => STD_LOGIC_VECTOR(wire_bcd_2),
        digit_2 => STD_LOGIC_VECTOR(wire_bcd_1),
        digit_1 => STD_LOGIC_VECTOR(wire_bcd_0),
        clk => clk,
        segments_out => segments,
        anodes => anodes
    );
    
    BCD : BCD_converter
     port map(
        binary_in => s_result,
        ones_digit => s_result_ones,
        tens_digit => s_result_tens
    );
    
    BCD_a_converter : BCD_converter
    port map(
        binary_in => '0' & a_in,
        ones_digit => a_in_ones,
        tens_digit => a_in_tens
    );

    BCD_b_converter : BCD_converter
    port map(
        binary_in => '0' & b_in,
        ones_digit => b_in_ones,
        tens_digit => b_in_tens
    );

    button_detection <= ((current_button) and (not past_button));
    led_0 <= s_led_0;
    led_1 <= s_led_1;
    process(clk)
    begin
        if rising_edge(clk) then 

            if btn = stable_button then
                debounce_counter <= 0;
            else
                debounce_counter <= debounce_counter + 1;
                if debounce_counter = 4_000_000 then 
                    stable_button <= btn; 
                    debounce_counter <= 0;
                end if;
            end if;

            current_button <= stable_button;
            past_button <= current_button;

            if button_detection = '1' then
                show_result <= not show_result;
            end if;

            if show_result = '1' then
                wire_bcd_0 <= UNSIGNED(s_result_ones);
                wire_bcd_1 <= UNSIGNED(s_result_tens);
                wire_bcd_2 <= "1100";
                wire_bcd_3 <= "1100";
            else
                wire_bcd_0 <= UNSIGNED(a_in_ones);
                wire_bcd_1 <= UNSIGNED(a_in_tens);
                wire_bcd_2 <= UNSIGNED(b_in_ones);
                wire_bcd_3 <= UNSIGNED(b_in_tens);
            end if;

        end if;
    end process;
end RTL;