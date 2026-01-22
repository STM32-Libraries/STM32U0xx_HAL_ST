cmake_minimum_required(VERSION 3.22)

project(stm32u0xx_hal_st)

set(HAL_DIR stm32u0xx-hal-driver)
set(SRC_DIR ${HAL_DIR}/Src)

# Set include directories and sources
set(INCLUDE_DIRS 
    ${HAL_DIR}/Inc
    ${HAL_DIR}/Inc/legacy
    ${CMAKE_CURRENT_SOURCE_DIR}/conf
    ${CMAKE_CURRENT_SOURCE_DIR}/cmsis-device-u0/Include
    ${CMAKE_CURRENT_SOURCE_DIR}/CMSIS_6/CMSIS/Core/Include
)

set(SOURCES
    ${SRC_DIR}/stm32u0xx_hal_adc.c
    ${SRC_DIR}/stm32u0xx_hal_adc_ex.c
    ${SRC_DIR}/stm32u0xx_hal.c
    ${SRC_DIR}/stm32u0xx_hal_comp.c
    ${SRC_DIR}/stm32u0xx_hal_cortex.c
    ${SRC_DIR}/stm32u0xx_hal_crc.c
    ${SRC_DIR}/stm32u0xx_hal_crc_ex.c
    ${SRC_DIR}/stm32u0xx_hal_cryp.c
    ${SRC_DIR}/stm32u0xx_hal_cryp_ex.c
    ${SRC_DIR}/stm32u0xx_hal_dac.c
    ${SRC_DIR}/stm32u0xx_hal_dac_ex.c
    ${SRC_DIR}/stm32u0xx_hal_dma.c
    ${SRC_DIR}/stm32u0xx_hal_dma_ex.c
    ${SRC_DIR}/stm32u0xx_hal_exti.c
    ${SRC_DIR}/stm32u0xx_hal_flash.c
    ${SRC_DIR}/stm32u0xx_hal_flash_ex.c
    ${SRC_DIR}/stm32u0xx_hal_gpio.c
    ${SRC_DIR}/stm32u0xx_hal_i2c.c
    ${SRC_DIR}/stm32u0xx_hal_i2c_ex.c
    ${SRC_DIR}/stm32u0xx_hal_irda.c
    ${SRC_DIR}/stm32u0xx_hal_iwdg.c
    ${SRC_DIR}/stm32u0xx_hal_lcd.c
    ${SRC_DIR}/stm32u0xx_hal_lptim.c
    ${SRC_DIR}/stm32u0xx_hal_msp_template.c
    ${SRC_DIR}/stm32u0xx_hal_opamp.c
    ${SRC_DIR}/stm32u0xx_hal_opamp_ex.c
    ${SRC_DIR}/stm32u0xx_hal_pcd.c
    ${SRC_DIR}/stm32u0xx_hal_pcd_ex.c
    ${SRC_DIR}/stm32u0xx_hal_pwr.c
    ${SRC_DIR}/stm32u0xx_hal_pwr_ex.c
    ${SRC_DIR}/stm32u0xx_hal_rcc.c
    ${SRC_DIR}/stm32u0xx_hal_rcc_ex.c
    ${SRC_DIR}/stm32u0xx_hal_rng.c
    ${SRC_DIR}/stm32u0xx_hal_rng_ex.c
    ${SRC_DIR}/stm32u0xx_hal_rtc.c
    ${SRC_DIR}/stm32u0xx_hal_rtc_ex.c
    ${SRC_DIR}/stm32u0xx_hal_smartcard.c
    ${SRC_DIR}/stm32u0xx_hal_smartcard_ex.c
    ${SRC_DIR}/stm32u0xx_hal_spi.c
    ${SRC_DIR}/stm32u0xx_hal_spi_ex.c
    ${SRC_DIR}/stm32u0xx_hal_tim.c
    ${SRC_DIR}/stm32u0xx_hal_timebase_rtc_alarm_template.c
    ${SRC_DIR}/stm32u0xx_hal_timebase_rtc_wakeup_template.c
    ${SRC_DIR}/stm32u0xx_hal_timebase_tim_template.c
    ${SRC_DIR}/stm32u0xx_hal_tim_ex.c
    ${SRC_DIR}/stm32u0xx_hal_tsc.c
    ${SRC_DIR}/stm32u0xx_hal_uart.c
    ${SRC_DIR}/stm32u0xx_hal_uart_ex.c
    ${SRC_DIR}/stm32u0xx_hal_usart.c
    ${SRC_DIR}/stm32u0xx_hal_usart_ex.c
    ${SRC_DIR}/stm32u0xx_hal_wwdg.c
    ${SRC_DIR}/stm32u0xx_ll_adc.c
    ${SRC_DIR}/stm32u0xx_ll_comp.c
    ${SRC_DIR}/stm32u0xx_ll_crc.c
    ${SRC_DIR}/stm32u0xx_ll_crs.c
    ${SRC_DIR}/stm32u0xx_ll_dac.c
    ${SRC_DIR}/stm32u0xx_ll_dma.c
    ${SRC_DIR}/stm32u0xx_ll_exti.c
    ${SRC_DIR}/stm32u0xx_ll_gpio.c
    ${SRC_DIR}/stm32u0xx_ll_i2c.c
    ${SRC_DIR}/stm32u0xx_ll_lptim.c
    ${SRC_DIR}/stm32u0xx_ll_lpuart.c
    ${SRC_DIR}/stm32u0xx_ll_opamp.c
    ${SRC_DIR}/stm32u0xx_ll_pwr.c
    ${SRC_DIR}/stm32u0xx_ll_rcc.c
    ${SRC_DIR}/stm32u0xx_ll_rng.c
    ${SRC_DIR}/stm32u0xx_ll_rtc.c
    ${SRC_DIR}/stm32u0xx_ll_spi.c
    ${SRC_DIR}/stm32u0xx_ll_tim.c
    ${SRC_DIR}/stm32u0xx_ll_usart.c
    ${SRC_DIR}/stm32u0xx_ll_usb.c
    ${SRC_DIR}/stm32u0xx_ll_utils.c
)

# Create static library
add_library(${PROJECT_NAME} STATIC ${SOURCES})

# Configure library compilation options
target_include_directories(${PROJECT_NAME} PUBLIC ${INCLUDE_DIRS})

# Configure additional compilation options, if needed
target_compile_options(${PROJECT_NAME} PRIVATE 
                                        -c 
                                        -mcpu=cortex-m0plus
                                        -std=c11 
                                        -Wall
                                        -mthumb
                                        )

# Define target macros
target_compile_definitions(${PROJECT_NAME} PUBLIC STM32U073xx)
# target_compile_definitions(${PROJECT_NAME} PUBLIC STM32U083xx)
# target_compile_definitions(${PROJECT_NAME} PUBLIC STM32U031xx)

# Configure linking options, if needed
# target_link_libraries(${PROJECT_NAME} ...)

# Configure installation options, if needed
# install(TARGETS ${PROJECT_NAME} DESTINATION lib)
# install(FILES ... DESTINATION include)
