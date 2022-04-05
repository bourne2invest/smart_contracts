// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// solidity provies some native units for dealing with time

// the variable `now` will return the current unix timestamp of the latest block (the number of seconds that have passed since 1/1/1970).

// Note: Unix time is traditionally stored in 32-bit number.
// 2038 problem: when 32-bit unix timestamps will overflow and break legacy systems
// to keep our dApp running 20 years from now, we could use a 64-bit number instead--but our users would spend more gas to use our dApp in the meantime.

// solidity has time units seconds, minutes, hours, days, weeks and years.
// These convert to a uint of the number of seconds in that length of time.
// 1 minutes is 60, 1 hour is 3600, 1 day is 86400

uint lastUpdated;

// set `lastUpdated` to `now`
function updateTimestamp() public {
    lastUpdated = now;
}

// will return true if 5 mins have passed since `updateTimestamp` was called, false otherwise
function fiveMinutesHavePassed() public view returns (bool) {
    return (now >= (lastUpdated + 5 minutes));
}
