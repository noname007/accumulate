<?php
	class A{
		private $_hhh = '11111111111';
		function set(){
			$this->_hhh = '222222222';
		}
		function get(){
			echo $this->_hhh,PHP_EOL;
		}

	}

	class B extends A{
		function say(){
			$this->_hhh;
		}
		function __get($name){
			echo $name;
		}
	}
	($a = new B)
	;
	$a->get();
	$a->set();
	$a->get();
