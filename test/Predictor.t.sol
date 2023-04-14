// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Predictor.sol";

contract PredictorTest is Test {
    Predictor public predictor;

    function setUp() public {
        predictor = new Predictor();
        predictor.add(1, 2);
    }

    function testAddAgain() public {
        predictor.add(1, 2);
    }

    function testAddAgainAndAgain() public {
        predictor.add(2, 1);
    }

    function testAddAgainAndAgainAndAgain() public {
        predictor.add(1, 2);
    }

    function testAddAgainAndAgainAndAgainAndAgain() public {
        predictor.add(2, 1);
    }

    function testSimpleAdd() public {
        predictor.simpleAdd(1, 2);
    }

    function testSimpleAddAgain() public {
        predictor.simpleAdd(1, 2);
    }

    function testSimpleAddAgainAndAgain() public {
        predictor.simpleAdd(1, 2);
    }

    function testSimpleAddAgainAndAgainAndAgain() public {
        predictor.simpleAdd(1, 2);
    }
}
