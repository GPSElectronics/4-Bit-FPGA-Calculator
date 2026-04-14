library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity SegmentDisplay_3 is
    Port ( 
           digit_4 : in STD_LOGIC_VECTOR (3 downto 0); -- Thousands
           digit_3 : in STD_LOGIC_VECTOR (3 downto 0); -- Hundreds
           digit_2 : in STD_LOGIC_VECTOR (3 downto 0); -- Tens
           digit_1 : in STD_LOGIC_VECTOR (3 downto 0); -- Ones
           clk : in STD_LOGIC;
           segments_out : out STD_LOGIC_VECTOR (6 downto 0);
           anodes : out STD_LOGIC_VECTOR(3 downto 0));
end SegmentDisplay_3;

architecture RTL of SegmentDisplay_3 is
    signal digit_MUX : STD_LOGIC_VECTOR(1 downto 0) := "00"; 
    signal current_digit : STD_LOGIC_VECTOR(3 downto 0);
    signal refresh_counter : integer := 0;

begin
    process(current_digit)
    begin
        case current_digit is
            when "0000" => segments_out <= "0000001"; -- 0
            when "0001" => segments_out <= "1001111"; -- 1
            when "0010" => segments_out <= "0010010"; -- 2
            when "0011" => segments_out <= "0000110"; -- 3
            when "0100" => segments_out <= "1001100"; -- 4
            when "0101" => segments_out <= "0100100"; -- 5
            when "0110" => segments_out <= "0100000"; -- 6
            when "0111" => segments_out <= "0001111"; -- 7
            when "1000" => segments_out <= "0000000"; -- 8
            when "1001" => segments_out <= "0000100"; -- 9
            when others => segments_out <= "1111111"; -- 10~15
        end case;
    end process;

    process(digit_MUX)
        begin 
        case digit_MUX is
            when "00" => anodes <= "1110";
                         current_digit <= digit_1;  
            when "01" => anodes <= "1101";
                         current_digit <= digit_2;
            when "10" => anodes <= "1011";
                         current_digit <= digit_3;
            when "11" => anodes <= "0111";
                         current_digit <= digit_4;
            when others => anodes <= "1111"; -- Keep display off if an error occurs, since a STD_LOGIC_VECTOR has 9 possible states
                           current_digit <= "0000";
        end case;
    end process;

    process(clk)
    begin 
        if rising_edge(clk) then 
            refresh_counter <= refresh_counter + 1;
            if refresh_counter = 99999 then
                refresh_counter <= 0;
                digit_MUX <= std_logic_vector(unsigned(digit_MUX) + 1);
            end if;
        end if;
    end process;

end RTL;
