library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;

entity ALU_Brain is
    Port ( a_in : in STD_LOGIC_VECTOR (3 downto 0);
           b_in : in STD_LOGIC_VECTOR (3 downto 0);
           operation : in STD_LOGIC_VECTOR (1 downto 0);
           led_0 : out STD_LOGIC;
           led_1 : out STD_LOGIC;
           result : out STD_LOGIC_VECTOR (4 downto 0));
end ALU_Brain;

architecture Behavioral of ALU_Brain is
    signal A_extension : UNSIGNED(4 downto 0); --1 bit extra for the carry
    signal B_extension : UNSIGNED(4 downto 0);

begin
    process(a_in,b_in,operation)
    begin
        case operation is
            when "00" =>
                result <= std_logic_vector(resize(unsigned(a_in), 5) + resize(unsigned(b_in), 5));
                led_0 <= '0';
                led_1 <= '0';
            when "01" =>
                result <= std_logic_vector(resize(unsigned(a_in), 5) - resize(unsigned(b_in), 5));
                led_0 <= '1';
                led_1 <= '0';
            when "10" =>
                result <= std_logic_vector(resize(unsigned(a_in), 5) and resize(unsigned(b_in), 5));
                led_0 <= '0';
                led_1 <= '1';
            when "11" =>
                result <= std_logic_vector(resize(unsigned(a_in), 5) or resize(unsigned(b_in), 5));
                led_0 <= '1';
                led_1 <= '1';
            when others =>
                result <= (others => '0');
                led_0 <= '0';
                led_1 <= '0';
        end case;
    end process;

end Behavioral;
