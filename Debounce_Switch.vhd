library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity Debounce_Switch is
    port (
        i_Clk   : in std_logic;
        i_Switch : in std_logic; -- noisy switch input

        o_Switch : out std_logic -- filtered output
        
    );
end entity;

architecture rtl of Debounce_Switch is

    constant c_DEBOUNCE_LIMIT : integer := 250000; -- 25 MHz clock, debounce counter limit (10 ms stabilization period)

    signal r_State : std_logic := '0';
    signal r_Count : integer range 0 to c_DEBOUNCE_LIMIT := 0;
    
    
begin
    
    p_Debounce: process (i_Clk) is
    begin
        if rising_edge(i_Clk) then
            if (i_Switch/=r_State and r_Count < c_DEBOUNCE_LIMIT) then 
                r_Count<= r_Count+1; -- counter increment if change in switches state
            elsif r_Count = c_DEBOUNCE_LIMIT then
                r_State <=i_Switch; -- State update after counter limit reached
                r_Count<=0; -- counter reset
            else
                r_Count<=0; -- reset counter if stable state
            end if;

        end if;
    end process p_Debounce;

    o_Switch <= r_State; -- assigning filtered debounce state to output

    

end architecture rtl;
