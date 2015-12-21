<?php

	function camel2id($name, $separator = '-', $strict = false)
    {
        // echo 
        $regex = $strict ? '/[A-Z]/' : '/(?<![A-Z])[A-Z]/';

        if ($separator === '_') {
        	return preg_replace($regex, '_\0', $name);
            return trim(strtolower(preg_replace($regex, '_\0', $name)), '_');
        } else {
            return trim(strtolower(str_replace('_', $separator, preg_replace($regex, $separator . '\0', $name))), $separator);
        }
    }

    /**
     * Converts an ID into a CamelCase name.
     * Words in the ID separated by `$separator` (defaults to '-') will be concatenated into a CamelCase name.
     * For example, 'post-tag' is converted to 'PostTag'.
     * @param string $id the ID to be converted
     * @param string $separator the character used to separate the words in the ID
     * @return string the resulting CamelCase name
     */
   	

   	function id2camel($id, $separator = '-')
    {
        return str_replace(' ', '', ucwords(implode(' ', explode($separator, $id))));
    }

    echo camel2id('aBCDCContToller','_');
    echo PHP_EOL;
    echo id2camel('abdf-dfdfd-fdfdfadf');
