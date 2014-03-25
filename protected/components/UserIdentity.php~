<?php
/**
 * UserIdentity.php
 *
 * @author: antonio ramirez <amigo.cobos@gmail.com>
 * Date: 8/12/12
 * Time: 10:00 PM
 */
class UserIdentity extends CUserIdentity {
	/**
	 * @var integer id of logged user
	 */
	private $_id;
	private $_first_name;
	private $_last_name;

	/**
	 * Authenticates username and password
	 * @return boolean CUserIdentity::ERROR_NONE if successful authentication
	 */
	public function authenticate() {
		$attribute = strpos($this->username, '@') ? 'email' : 'username';
		  
		  
		$user = User::model()->find(array('condition' => $attribute . '=:loginname', 'params' =>
			array(':loginname' => $this->username)));

		if ($user === null) {
		         
			$this->errorCode = self::ERROR_USERNAME_INVALID;
		} 
	        else if ($user->password!=md5($this->password)) {
		
		 
			$this->errorCode = self::ERROR_PASSWORD_INVALID;
			}
		 else {
			//$user->regenerateValidationKey();
			$this->_id = $user->id;
			$this->_first_name = $user->first_name;
			$this->_last_name = $user->last_name;
			$this->username = $user->email;
		        $this->setState('firstName', $user->first_name);
		        $this->setState('lastName', $user->last_name);
			
			$this->errorCode = self::ERROR_NONE;
		}
		return !$this->errorCode;
	}

	/**
	 * Creates an authenticated user with no passwords for registration
	 * process (checkout)
	 * @param string $username
	 * @return self
	 */
	public static function createAuthenticatedIdentity($id, $username) {
		$identity = new self($username, '');
		$identity->_id = $id;
		$identity->errorCode = self::ERROR_NONE;
		return $identity;
	}

	/**
	 *
	 * @return integer id of the logged user, null if not set
	 */
	public function getId() {
		return $this->_id;
	}
	public function getFirstName() {
		return $this->_first_name;
	}
	public function getLastName() {
		return $this->_last_name;
	}
}