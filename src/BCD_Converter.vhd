library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;

entity BCD_converter is
    port (
        binary_in : in STD_LOGIC_VECTOR (4 downto 0);
        ones_digit : out STD_LOGIC_VECTOR(3 downto 0);
        tens_digit : out STD_LOGIC_VECTOR(3 downto 0)
    );
end BCD_converter;

architecture RTL of BCD_Converter is
    signal current_digit : UNSIGNED(3 downto 0);

begin
    process(binary_in)
    begin
        if to_integer(unsigned(binary_in)) >= 30 then
            tens_digit <= "0011";
            ones_digit <= STD_LOGIC_VECTOR(to_unsigned(to_integer(unsigned(binary_in)) - 30, 4));
        
        elsif to_integer(unsigned(binary_in)) >= 20 then
            tens_digit <= "0010";
            ones_digit <= STD_LOGIC_VECTOR(to_unsigned(to_integer(unsigned(binary_in)) - 20, 4));
            
        elsif to_integer(unsigned(binary_in)) >= 10 then 
            tens_digit <= "0001";
            ones_digit <= STD_LOGIC_VECTOR(to_unsigned(to_integer(unsigned(binary_in)) - 10, 4));
            
        else 
            tens_digit <= "0000";
            ones_digit <= binary_in(3 downto 0);  
        end if;
    end process;

end architecture;