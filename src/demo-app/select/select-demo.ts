import {Component} from '@angular/core';
import {FormControl} from '@angular/forms';

@Component({
  moduleId: module.id,
  selector: 'select-demo',
  templateUrl: 'select-demo.html',
  styleUrls: ['select-demo.css'],
})
export class SelectDemo {
  isRequired = false;

  foods = [
    {value: '', viewValue: '-'},
    {value: 'steak-0', viewValue: 'Steak'},
    {value: 'pizza-1', viewValue: 'Pizza'},
    {value: 'tacos-2', viewValue: 'Tacos'}
  ];

  control = new FormControl('');

  constructor() {
    this.control.setValue('steak-0');
  }


  select(value: any) {
    alert(value);
  }

}
