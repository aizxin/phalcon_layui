<?php
namespace Sow\Validations;

use Phalcon\Validation;

use Phalcon\Validation\Validator\PresenceOf;
use Phalcon\Validation\Validator\Uniqueness;
use Sow\Traits\Validation as ValidationTraits;

class RoleValidation extends Validation
{
    use ValidationTraits;
    public function initialize()
    {
        $this->add(
             [
                "name",
                "slug",
            ],
            new PresenceOf(
                [
                    "message" => [
                        'name' => $this->lang->t('role.name').$this->lang->t('validator.PresenceOf'),
                        'slug' => $this->lang->t('role.slug').$this->lang->t('validator.PresenceOf')
                    ]
                ]
            )
        );
        $this->add(
            "name",
             new Uniqueness(
                [
                    "model"   => new \Sow\Models\Role(),
                    "message" => $this->lang->t('role.name').$this->lang->t('validator.Uniqueness'),
                ]
            )
        );
    }
}