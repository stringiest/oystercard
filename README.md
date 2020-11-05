# Oystercard Challenge

Challenge to create an Oystercard-type system.

## Class diagram

![Class diagram for oystercard challenge](https://github.com/stringiest/oystercard/blob/main/Class%20diagram.png)

## Project set-up

### Initial rspec run
Produces a NameError: uninitialized constant Oystercard  
Error in ./spec/oystercard_spec.rb, on line 1

*Error means that the constant Oystercard isn't recognised: define Oystercard in a separate file and require the file in the spec.*


## User Stories

```
In order to use public transport
As a customer
I want money on my card
```
Feature test - to check that balance is zero  
require './lib/oystercard'  
oystercard = Oystercard.new  
oystercard.balance (should equal zero)

```
In order to keep using public transport
As a customer
I want to add money to my card
```
Feature test - to check that can add money to oystercard  
require './lib/oystercard'  
oystercard = Oystercard.new  
oystercard.top_up(5)

```
In order to protect my money
As a customer
I don't want to put too much money on my card
```
Feature test - to limit cash added to card  
require './lib/oystercard'  
oystercard = Oystercard.new  
oystercard.top_up(100) - should give error as > limit of £90

```
In order to pay for my journey
As a customer
I need my fare deducted from my card
```
Feature test - to check that can deduct money from oystercard  
require './lib/oystercard'  
oystercard = Oystercard.new  
oystercard.deduct(5)

```
In order to get through the barriers
As a customer
I need to touch in and out
```
Feature test - to check that I can touch in  
require './lib/oystercard'  
oystercard = Oystercard.new  
oystercard.touch_in  

Feature test - to check that I can touch out  
require './lib/oystercard'  
oystercard = Oystercard.new  
oystercard.touch_out  

Feature test - to test in_journey is true after touch_in  
require './lib/oystercard'  
oystercard = Oystercard.new  
oystercard.touch_in  
oystercard.in_journey? == true

```
In order to pay for my journey
As a customer
I need to have the minimum amount for a single journey
```
Feature test - to check that minimum balance required for travel  
require './lib/oystercard'  
oystercard = Oystercard.new  
oystercard.touch_in  - presents error as not topped up

```
In order to pay for my journey
As a customer
I need to pay for my journey when it's complete
```
Feature test - to check that can deduct money from oystercard  
require './lib/oystercard'  
oystercard = Oystercard.new  
oystercard.top_up(20)  
oystercard.touch_in  
oystercard.touch_out - expect to return 19

```
In order to pay for my journey
As a customer
I need to know where I've travelled from
```
Feature test - to check that start station is stored  
require './lib/oystercard'  
oystercard = Oystercard.new  
oystercard.top_up(20)  
oystercard.touch_in(station)  
\@entry_station == station - should return true

```
In order to know where I have been
As a customer
I want to see to all my previous trips
```
Feature test - to check that end station is stored  
require './lib/oystercard'  
oystercard = Oystercard.new  
oystercard.top_up(20)  
oystercard.touch_in(station)  
oystercard.touch_out(station)  
oystercard.journey_history[-1] == {entry: station, exit: station} - should return true

```
In order to know how far I have travelled
As a customer
I want to know what zone a station is in
```
Feature test - a station knows what zone it is in  
require './lib/station'  
station = Station.new("Old Street", 1)  
station.zone == 1 - should return true  
station.name == "Old Street" - should return true

```
In order to be charged correctly
As a customer
I need a penalty charge deducted if I fail to touch in or out

In order to be charged the correct amount
As a customer
I need to have the correct fare calculated
```
