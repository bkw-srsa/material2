import {Component} from '@angular/core';
import {FormGroup, FormBuilder, Validators, FormControl} from "@angular/forms";


let max = 5;

@Component({
  moduleId: module.id,
  selector: 'input-demo',
  templateUrl: 'input-demo.html',
  styleUrls: ['input-demo.css'],
})
export class InputDemo {
  validationForm: FormGroup;
  dividerColor: boolean;
  requiredField: boolean;
  floatingLabel: boolean;
  name: string;
  items: any[] = [
    { value: 10 },
    { value: 20 },
    { value: 30 },
    { value: 40 },
    { value: 50 },
  ];
  rows = 8;

  constructor(private fb: FormBuilder) {

    this.validationForm = this.fb.group({
            username: new FormControl({value: '', disabled: false}, Validators.minLength(5)),
            password: new FormControl({value: '', disabled: false}, Validators.required),

        }
    );
  }

  addABunch(n: number) {
    for (let x = 0; x < n; x++) {
      this.items.push({ value: ++max });
    }
  }

}
