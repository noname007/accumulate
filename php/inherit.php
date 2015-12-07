<?php

	/**
	* 
	*/
	class ClassName1
	{
		// private $_event = 1111;
		protected $_event = 1111111111;
		// protected function echo_(){
		private function echo_(){
			echo "\n111111111111111\n";
		}
		public function echo_event(){
			echo $this->_event,get_called_class();
			$this->echo_();	
		}

	}

	/**
	* 		
	*/
	class ClassName2 extends ClassName1
	{
		public $_event = 22222;
		protected function echo_(){
			echo "\n22222222222222\n";
		}
	}

	(new ClassName2)->echo_event();

