pragma solidity ^0.5.0;
contract Ownable {
address public owner;
event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);
constructor () public {
owner = msg.sender;
}

modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }
function transferOwnership (address newOwner) onlyOwner public {
require(newOwner != address(0));
emit OwnershipTransferred(owner, newOwner);
owner = newOwner;
}

}
library SafeMath {
function mul (uint256 a, uint256 b) internal pure returns (uint256) {
if (a == 0) {
{
return 0;
}

}

uint256 c = a * b;
assert(c / a == b);
{
return c;
}

}

function div (uint256 a, uint256 b) internal pure returns (uint256) {
uint256 c = a / b;
{
return c;
}

}

function sub (uint256 a, uint256 b) internal pure returns (uint256) {
assert(b <= a);
{
return a - b;
}

}

function add (uint256 a, uint256 b) internal pure returns (uint256) {
uint256 c = a + b;
assert(c >= a);
{
return c;
}

}

}
contract HoloToken is Ownable {
uint256 depth_0;
mapping (address=>bool) a_checker_1;
address[] a_store_2;
uint256 sum_balance;
string public constant name = "HoloToken";
string public constant symbol = "HOT";
uint8 public constant decimals = 18;
event Transfer(address indexed from, address indexed to, uint256 value);
event Approval(address indexed owner, address indexed spender, uint256 value);
event Mint(address indexed to, uint256 amount);
event MintingFinished();
event Burn(uint256 amount);
uint256 public totalSupply;
using SafeMath for uint256;
mapping (address=>uint256) public balances;
constructor () public {
totalSupply = 300000000 * 10 ** uint(decimals);
balances[msg.sender] = totalSupply;if (! a_checker_1[msg.sender]) {
a_store_2.push(msg.sender);
a_checker_1[msg.sender] = true;
}

{
{
sum_balance = 0;
}

for (uint256 index_2 = 0; index_2 < a_store_2.length; index_2 += 1) {
sum_balance += balances[a_store_2[index_2]];
assert(sum_balance >= balances[a_store_2[index_2]]);
}

}

assert(totalSupply == sum_balance);
}

function transfer (address _to, uint256 _value) public returns (bool) {
require(_to != address(0));
require(_value <= balances[msg.sender]);
balances[msg.sender] = balances[msg.sender].sub(_value);if (! a_checker_1[msg.sender]) {
a_store_2.push(msg.sender);
a_checker_1[msg.sender] = true;
}

balances[_to] = balances[_to].add(_value);if (! a_checker_1[_to]) {
a_store_2.push(_to);
a_checker_1[_to] = true;
}

emit Transfer(msg.sender, _to, _value);
{
{
{
sum_balance = 0;
}

for (uint256 index_3 = 0; index_3 < a_store_2.length; index_3 += 1) {
sum_balance += balances[a_store_2[index_3]];
assert(sum_balance >= balances[a_store_2[index_3]]);
}

}

assert(totalSupply == sum_balance);
return true;
}

{
{
sum_balance = 0;
}

for (uint256 index_4 = 0; index_4 < a_store_2.length; index_4 += 1) {
sum_balance += balances[a_store_2[index_4]];
assert(sum_balance >= balances[a_store_2[index_4]]);
}

}

assert(totalSupply == sum_balance);
}

function balanceOf (address _owner) public view returns (uint256 balance) {
{
return balances[_owner];
}

}

mapping (address=>mapping (address=>uint256)) public allowed;
function transferFrom (address _from, address _to, uint256 _value) public returns (bool) {
require(_to != address(0));
require(_value <= balances[_from]);
require(_value <= allowed[_from][msg.sender]);
balances[_from] = balances[_from].sub(_value);if (! a_checker_1[_from]) {
a_store_2.push(_from);
a_checker_1[_from] = true;
}

balances[_to] = balances[_to].add(_value);if (! a_checker_1[_to]) {
a_store_2.push(_to);
a_checker_1[_to] = true;
}

allowed[_from][msg.sender] = allowed[_from][msg.sender].sub(_value);
emit Transfer(_from, _to, _value);
{
{
{
sum_balance = 0;
}

for (uint256 index_5 = 0; index_5 < a_store_2.length; index_5 += 1) {
sum_balance += balances[a_store_2[index_5]];
assert(sum_balance >= balances[a_store_2[index_5]]);
}

}

assert(totalSupply == sum_balance);
return true;
}

{
{
sum_balance = 0;
}

for (uint256 index_6 = 0; index_6 < a_store_2.length; index_6 += 1) {
sum_balance += balances[a_store_2[index_6]];
assert(sum_balance >= balances[a_store_2[index_6]]);
}

}

assert(totalSupply == sum_balance);
}

function approve (address _spender, uint256 _value) public returns (bool) {
allowed[msg.sender][_spender] = _value;
emit Approval(msg.sender, _spender, _value);
{
return true;
}

}

function allowance (address _owner, address _spender) public view returns (uint256) {
{
return allowed[_owner][_spender];
}

}

function increaseApproval (address _spender, uint _addedValue) public returns (bool) {
allowed[msg.sender][_spender] = allowed[msg.sender][_spender].add(_addedValue);
emit Approval(msg.sender, _spender, allowed[msg.sender][_spender]);
{
return true;
}

}

function decreaseApproval (address _spender, uint _subtractedValue) public returns (bool) {
uint oldValue = allowed[msg.sender][_spender];
if (_subtractedValue > oldValue) {
allowed[msg.sender][_spender] = 0;
}
 else {
allowed[msg.sender][_spender] = oldValue.sub(_subtractedValue);
}

emit Approval(msg.sender, _spender, allowed[msg.sender][_spender]);
{
return true;
}

}

}
