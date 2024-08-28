library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity Binary_To_7Segment is
    port (
        i_Clk  : in std_logic;
        i_Binary_Num : in std_logic_vector(3 downto 0); -- taking in 4 bit binary number, drive output accordingly
        o_Segment_A : out std_logic;
        o_Segment_B : out std_logic;
        o_Segment_C : out std_logic;
        o_Segment_D : out std_logic;
        o_Segment_E : out std_logic;
        o_Segment_F : out std_logic;
        o_Segment_G : out std_logic
    );
end entity Binary_To_7Segment;

architecture rtl of Binary_To_7Segment is
    signal r_Hex_Encoding : std_logic_vector(7 downto 0) := (others=> '0'); -- take array of bits (7 down to 0), assign them to 0
begin
    process (i_Clk) is
    begin
        if rising_edge(i_Clk) then 
            case i_Binary_Num is  
                when "0000" => r_Hex_Encoding <= X"7E"; -- Hex 0
                when "0001" => r_Hex_Encoding <= X"30"; -- Hex 1
                when "0010" => r_Hex_Encoding <= X"6D"; -- Hex 2
                when "0011" => r_Hex_Encoding <= X"79"; -- Hex 3
                when "0100" => r_Hex_Encoding <= X"33"; -- Hex 4
                when "0101" => r_Hex_Encoding <= X"5B"; -- Hex 5
                when "0110" => r_Hex_Encoding <= X"5F"; -- Hex 6
                when "0111" => r_Hex_Encoding <= X"70"; -- Hex 7
                when "1000" => r_Hex_Encoding <= X"7F"; -- Hex 8
                when "1001" => r_Hex_Encoding <= X"7B"; -- Hex 9
                when "1010" => r_Hex_Encoding <= X"77"; -- Hex A
                when "1011" => r_Hex_Encoding <= X"1F"; -- Hex B
                when "1100" => r_Hex_Encoding <= X"4E"; -- Hex C
                when "1101" => r_Hex_Encoding <= X"3D"; -- Hex D
                when "1110" => r_Hex_Encoding <= X"4F"; -- Hex E
                when "1111" => r_Hex_Encoding <= X"47"; -- Hex F
                when others => null;
            end case;
        end if;
    end process;

    o_Segment_A <= r_Hex_Encoding(6); -- set each segment to corresponding bit value from the Hex Encoding, generated using cases
    o_Segment_B <= r_Hex_Encoding(5);
    o_Segment_C <= r_Hex_Encoding(4);
    o_Segment_D <= r_Hex_Encoding(3);
    o_Segment_E <= r_Hex_Encoding(2);
    o_Segment_F <= r_Hex_Encoding(1);
    o_Segment_G <= r_Hex_Encoding(0);
end architecture rtl;
