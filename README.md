# Oystercard Challenge

Challenge to create an Oystercard-type system.

## Project set-up

### Initial rspec run
Produces a NameError: uninitialized constant Oystercard
Error in ./spec/oystercard_spec.rb, on line 1

*Error means that the constant Oystercard isn't recognised.  Define Oystercard in a separate file and require the file in the spec.*


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

In order to pay for my journey
As a customer
I need to pay for my journey when it's complete

In order to pay for my journey
As a customer
I need to know where I've travelled from

In order to know where I have been
As a customer
I want to see to all my previous trips

In order to know how far I have travelled
As a customer
I want to know what zone a station is in

In order to be charged correctly
As a customer
I need a penalty charge deducted if I fail to touch in or out

In order to be charged the correct amount
As a customer
I need to have the correct fare calculated
```
