# ArduinoKit

The goal of this library is to be a Swift implementation of the Arduino Language, built on top of [CoreAVR](https://github.com/pdshelley/CoreAVR).

ArduinoKit supports microcontrollers using the AVR Architecture, more specifically the ATmega328P. Support for other AVR-based microcontrollers might be added as CoreAVR and ArduinoKit mature.

## Status
Support Status Legend:
| Symbol |              Meaning              |
|--------|-----------------------------------|
| ❌     | Unsupported                       |
| ✅     | Fully Implemented and Functional  |
| 🚧     | In Progress; Partially Functional |

|               Section              |                         | Support |                                          Note                                           |
|------------------------------------|-------------------------|---------|-----------------------------------------------------------------------------------------|
| Functions - Advanced IO            | `noTone`                | ❌      |                                                                                         |
| Functions - Advanced IO            | `pulseIn`               | ❌      |                                                                                         |
| Functions - Advanced IO            | `pulseInLong`           | ❌      |                                                                                         |
| Functions - Advanced IO            | `shiftIn`               | ❌      |                                                                                         |
| Functions - Advanced IO            | `shiftOut`              | ❌      |                                                                                         |
| Functions - Advanced IO            | `tone`                  | ❌      |                                                                                         |
| Functions - Analog IO              | `analogRead`            | ❌      |                                                                                         |
| Functions - Analog IO              | `analogReadResolution`  | ❌      |                                                                                         |
| Functions - Analog IO              | `analogReference`       | ❌      |                                                                                         |
| Functions - Analog IO              | `analogWrite`           | ❌      |                                                                                         |
| Functions - Analog IO              | `analogWriteResolution` | ❌      |                                                                                         |
| Functions - Bits and Bytes         | `bit`                   | ✅      |                                                                                         |
| Functions - Bits and Bytes         | `bitClear`              | ✅      |                                                                                         |
| Functions - Bits and Bytes         | `bitRead`               | ✅      |                                                                                         |
| Functions - Bits and Bytes         | `bitSet`                | ✅      |                                                                                         |
| Functions - Bits and Bytes         | `bitWrite`              | ✅      |                                                                                         |
| Functions - Bits and Bytes         | `highByte`              | ✅      |                                                                                         |
| Functions - Bits and Bytes         | `lowByte`               | ✅      |                                                                                         |
| Functions - Characters             | `isAlpha`               | ✅      |                                                                                         |
| Functions - Characters             | `isAlphaNumeric`        | ✅      |                                                                                         |
| Functions - Characters             | `isAscii`               | ✅      |                                                                                         |
| Functions - Characters             | `isControl`             | ✅      |                                                                                         |
| Functions - Characters             | `isDigit`               | ✅      |                                                                                         |
| Functions - Characters             | `isGraph`               | ✅      |                                                                                         |
| Functions - Characters             | `isHexadecimalDigit`    | ✅      |                                                                                         |
| Functions - Characters             | `isLowerCase`           | ✅      |                                                                                         |
| Functions - Characters             | `isPrintable`           | ✅      |                                                                                         |
| Functions - Characters             | `isPunct`               | ✅      |                                                                                         |
| Functions - Characters             | `isSpace`               | ✅      |                                                                                         |
| Functions - Characters             | `isUpperCase`           | ✅      |                                                                                         |
| Functions - Characters             | `isWhitespace`          | ✅      |                                                                                         |
| Functions - Communication          | `Print`                 | 🚧      | The `Print` protocol exists, but lacks some of the functions present in the reference.  |
| Functions - Communication          | `SPI`                   | ❌      |                                                                                         |
| Functions - Communication          | `Serial`                | 🚧      | The `Serial` protocol exists, but lacks some of the functions present in the reference. |
| Functions - Communication          | `Wire`                  | ❌      |                                                                                         |
| Functions - Communication          | `stream`                | 🚧      | The `Stream` protocol exists, but lacks some of the functions present in the reference. |
| Functions - Communication - SPI    | `SPISettings`           | ❌      |                                                                                         |
| Functions - Communication - SPI    | `begin`                 | ❌      |                                                                                         |
| Functions - Communication - SPI    | `beginTransaction`      | ❌      |                                                                                         |
| Functions - Communication - SPI    | `end`                   | ❌      |                                                                                         |
| Functions - Communication - SPI    | `endTransaction`        | ❌      |                                                                                         |
| Functions - Communication - SPI    | `setBitOrder`           | ❌      |                                                                                         |
| Functions - Communication - SPI    | `setClockDivider`       | ❌      |                                                                                         |
| Functions - Communication - SPI    | `setDataMode`           | ❌      |                                                                                         |
| Functions - Communication - SPI    | `transfer`              | ❌      |                                                                                         |
| Functions - Communication - SPI    | `usingInterrupt`        | ❌      |                                                                                         |
| Functions - Communication - Serial | `available`             | ❌      |                                                                                         |
| Functions - Communication - Serial | `availableForWrite`     | ❌      |                                                                                         |
| Functions - Communication - Serial | `begin`                 | ✅      |                                                                                         |
| Functions - Communication - Serial | `end`                   | ❌      |                                                                                         |
| Functions - Communication - Serial | `find`                  | ❌      |                                                                                         |
| Functions - Communication - Serial | `findUntil`             | ❌      |                                                                                         |
| Functions - Communication - Serial | `flush`                 | ❌      |                                                                                         |
| Functions - Communication - Serial | `getTimeout`            | ❌      |                                                                                         |
| Functions - Communication - Serial | `ifSerial`              | ❌      |                                                                                         |
| Functions - Communication - Serial | `parseFloat`            | ❌      |                                                                                         |
| Functions - Communication - Serial | `parseInt`              | ❌      |                                                                                         |
| Functions - Communication - Serial | `peek`                  | ❌      |                                                                                         |
| Functions - Communication - Serial | `print`                 | 🚧      | Only the basic print(StaticString) implementation is available as of now.               |
| Functions - Communication - Serial | `println`               | 🚧      | Only the basic println(StaticString) implementation is available as of now.             |
| Functions - Communication - Serial | `read`                  | ❌      |                                                                                         |
| Functions - Communication - Serial | `readBytes`             | ❌      |                                                                                         |
| Functions - Communication - Serial | `readBytesUntil`        | ❌      |                                                                                         |
| Functions - Communication - Serial | `readString`            | ❌      |                                                                                         |
| Functions - Communication - Serial | `readStringUntil`       | ❌      |                                                                                         |
| Functions - Communication - Serial | `serialEvent`           | ❌      |                                                                                         |
| Functions - Communication - Serial | `setTimeout`            | ❌      |                                                                                         |
| Functions - Communication - Serial | `write`                 | ✅      |                                                                                         |
| Functions - Communication - Stream | `streamAvailable`       | ❌      |                                                                                         |
| Functions - Communication - Stream | `streamFind`            | ❌      |                                                                                         |
| Functions - Communication - Stream | `streamFindUntil`       | ❌      |                                                                                         |
| Functions - Communication - Stream | `streamFlush`           | ❌      |                                                                                         |
| Functions - Communication - Stream | `streamGetTimeout`      | ❌      |                                                                                         |
| Functions - Communication - Stream | `streamParseFloat`      | ❌      |                                                                                         |
| Functions - Communication - Stream | `streamParseInt`        | ❌      |                                                                                         |
| Functions - Communication - Stream | `streamPeek`            | ❌      |                                                                                         |
| Functions - Communication - Stream | `streamRead`            | ❌      |                                                                                         |
| Functions - Communication - Stream | `streamReadBytes`       | ❌      |                                                                                         |
| Functions - Communication - Stream | `streamReadBytesUntil`  | ❌      |                                                                                         |
| Functions - Communication - Stream | `streamReadString`      | ❌      |                                                                                         |
| Functions - Communication - Stream | `streamReadStringUntil` | ❌      |                                                                                         |
| Functions - Communication - Stream | `streamSetTimeout`      | ❌      |                                                                                         |
| Functions - Communication - Wire   | `available`             | ❌      |                                                                                         |
| Functions - Communication - Wire   | `begin`                 | ❌      |                                                                                         |
| Functions - Communication - Wire   | `beginTransmission`     | ❌      |                                                                                         |
| Functions - Communication - Wire   | `clearWireTimeoutFlag`  | ❌      |                                                                                         |
| Functions - Communication - Wire   | `end`                   | ❌      |                                                                                         |
| Functions - Communication - Wire   | `endTransmission`       | ❌      |                                                                                         |
| Functions - Communication - Wire   | `getWireTimeoutFlag`    | ❌      |                                                                                         |
| Functions - Communication - Wire   | `onReceive`             | ❌      |                                                                                         |
| Functions - Communication - Wire   | `onRequest`             | ❌      |                                                                                         |
| Functions - Communication - Wire   | `read`                  | ❌      |                                                                                         |
| Functions - Communication - Wire   | `requestFrom`           | ❌      |                                                                                         |
| Functions - Communication - Wire   | `setClock`              | ❌      |                                                                                         |
| Functions - Communication - Wire   | `setWireTimeout`        | ❌      |                                                                                         |
| Functions - Communication - Wire   | `write`                 | ❌      |                                                                                         |
| Functions - Digital IO             | `digitalRead`           | ❌      |                                                                                         |
| Functions - Digital IO             | `digitalWrite`          | ❌      |                                                                                         |
| Functions - Digital IO             | `pinMode`               | ❌      |                                                                                         |
| Functions - External Interrupts    | `attachInterrupt`       | ❌      |                                                                                         |
| Functions - External Interrupts    | `detachInterrupt`       | ❌      |                                                                                         |
| Functions - External Interrupts    | `digitalPinToInterrupt` | ❌      |                                                                                         |
| Functions - Interrupts             | `interrupts`            | ✅      | Deprecated. Use CoreAVR's builtin `Interrupts.enableInterrupts` function instead.       |
| Functions - Interrupts             | `noInterrupts`          | ✅      | Deprecated. Use CoreAVR's builtin `Interrupts.disableInterrupts` function instead.      |
| Functions - Math                   | `abs`                   | ✅      |                                                                                         |
| Functions - Math                   | `constrain`             | ✅      |                                                                                         |
| Functions - Math                   | `map`                   | ✅      |                                                                                         |
| Functions - Math                   | `max`                   | ✅      |                                                                                         |
| Functions - Math                   | `min`                   | ✅      |                                                                                         |
| Functions - Math                   | `pow`                   | ❌      |                                                                                         |
| Functions - Math                   | `sq`                    | ✅      |                                                                                         |
| Functions - Math                   | `sqrt`                  | ❌      |                                                                                         |
| Functions - Random Numbers         | `random`                | ✅      | Deprecated. Use ArduinoKit's replacement `random` function instead.                     |
| Functions - Random Numbers         | `randomSeed`            | ✅      | Deprecated. Use ArduinoKit's replacement `random` function instead.                     |
| Functions - Time                   | `delay`                 | ❌      |                                                                                         |
| Functions - Time                   | `delayMicroseconds`     | ❌      |                                                                                         |
| Functions - Time                   | `micros`                | ❌      |                                                                                         |
| Functions - Time                   | `millis`                | ❌      |                                                                                         |
| Functions - Trigonometry           | `cos`                   | ❌      |                                                                                         |
| Functions - Trigonometry           | `sin`                   | ❌      |                                                                                         |
| Functions - Trigonometry           | `tan`                   | ❌      |                                                                                         |
| Functions - USB                    | `Keyboard`              | ❌      |                                                                                         |
| Functions - USB                    | `Mouse`                 | ❌      |                                                                                         |
| Functions - USB - Keyboard         | `keyboardBegin`         | ❌      |                                                                                         |
| Functions - USB - Keyboard         | `keyboardEnd`           | ❌      |                                                                                         |
| Functions - USB - Keyboard         | `keyboardModifiers`     | ❌      |                                                                                         |
| Functions - USB - Keyboard         | `keyboardPress`         | ❌      |                                                                                         |
| Functions - USB - Keyboard         | `keyboardPrint`         | ❌      |                                                                                         |
| Functions - USB - Keyboard         | `keyboardRelease`       | ❌      |                                                                                         |
| Functions - USB - Keyboard         | `keyboardReleaseAll`    | ❌      |                                                                                         |
| Functions - USB - Keyboard         | `keyboardWrite`         | ❌      |                                                                                         |
| Functions - USB - Mouse            | `mouseBegin`            | ❌      |                                                                                         |
| Functions - USB - Mouse            | `mouseClick`            | ❌      |                                                                                         |
| Functions - USB - Mouse            | `mouseEnd`              | ❌      |                                                                                         |
| Functions - USB - Mouse            | `mouseIsPressed`        | ❌      |                                                                                         |
| Functions - USB - Mouse            | `mouseMove`             | ❌      |                                                                                         |
| Functions - USB - Mouse            | `mousePress`            | ❌      |                                                                                         |
| Functions - USB - Mouse            | `mouseRelease`          | ❌      |                                                                                         |
| Structure - Sketch                 | `loop`                  | ❌      |                                                                                         |
| Structure - Sketch                 | `setup`                 | ❌      |                                                                                         |
| Variables - Constants              | `highLow`               | ✅      | Available in CoreAVR as `DigitalValue`                                                  |
| Variables - Constants              | `inputOutputPullup`     | ✅      | Partially available in CoreAVR as `DataDirectionFlag`                                   |
| Variables - Constants              | `LED_BUILTIN`           | ❌      |                                                                                         |
