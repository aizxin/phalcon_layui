<?php
namespace Sow\Validations;

use Phalcon\Validation;

use Phalcon\Validation\Validator\StringLength;
use Phalcon\Validation\Validator\PresenceOf;

use Sow\Traits\Validation as ValidationTraits;

class AuthValidation extends Validation
{
    use ValidationTraits;
    public function initialize()
    {
        $this->add(
            ["name","password"],
            new PresenceOf(
                [
                    "message" => [
                       "name" => $this->lang->t('user.name').$this->lang->t('validator.PresenceOf'),
                       "password" => $this->lang->t('user.password').$this->lang->t('validator.PresenceOf')
                    ]
                ]
            )
        );
        $this->add(
            "password",
             new StringLength(
                [
                    "max"            => 12,
                    "min"            => 6,
                    "messageMaximum" => $this->lang->t('user.password').$this->lang->t('validator.max'),
                    "messageMinimum" => $this->lang->t('user.password').$this->lang->t('validator.min')
                ]
            )
        );
    }
}