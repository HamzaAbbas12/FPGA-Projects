-- Include the IEEE library which contains standard logic definitions
library ieee;
use ieee.std_logic_1164.all;

-- Entity declaration for P3_FFs
-- This describes the external interface of the entity
entity P3_FFs is
    port (
        i_Clk   : in std_logic;      -- Clock input
        i_Switch_1 : in std_logic;   -- Input from a switch
        o_LED_1 : out std_logic      -- Output to an LED
    );
end entity P3_FFs;

-- Architecture declaration for P3_FFs
-- This describes the internal behavior and structure of the entity
architecture rtl of P3_FFs is

    -- Internal signals declaration
    signal r_LED_1 : std_logic := '0';      -- Internal signal for LED state
    signal r_Switch_1 : std_logic := '0';   -- Internal signal for switch state

begin

    -- Process declaration for p_Register
    -- This process is triggered on the rising edge of i_Clk
    p_Register : process (i_Clk) is 
    begin
        if rising_edge(i_Clk) then -- On rising edge of the clock signal
            r_Switch_1 <= i_Switch_1;  -- Capture the switch input state into the internal signal

            -- Check for a falling edge on the switch input
            if i_Switch_1 = '0' and r_Switch_1 = '1' then -- Falling Edge detected
                r_LED_1 <= not r_LED_1; -- Toggle the LED state
            end if;
        end if;
    end process p_Register;

    -- Assign the internal LED state signal to the output port
    o_LED_1 <= r_LED_1;

end architecture rtl;
