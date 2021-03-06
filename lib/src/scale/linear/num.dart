import 'package:meta/meta.dart';

import '../base.dart';
import 'base.dart';
import '../auto_ticks/num.dart';

class NumScale<D> extends LinearScale<num, D> {
  NumScale({
    bool nice,
    num min,
    num max,
    num tickInterval,

    String Function(num) formatter,
    List<double> range,
    String alias,
    int tickCount,
    List<num> ticks,

    @required num Function(D) accessor,
  }) {
    assert(
      tickCount == null || tickCount > 1,
      'TickCount should greater than 1.',
    );
    assert(
      max == null || min == null || max >= min,
      'max: $max should not be less than min: $min',
    );
    assert(
      range == null || range.length == 2,
      'range can only has 2 items'
    );

    this['nice'] = nice;
    this['min'] = min;
    this['max'] = max;
    this['tickInterval'] = tickInterval;
    this['formatter'] = formatter;
    this['range'] = range;
    this['alias'] = alias;
    this['tickCount'] = tickCount;
    this['ticks'] = ticks;

    this['accessor'] = accessor;
  }

  @override
  ScaleType get type => ScaleType.number;

  @override
  int compare(num a, num b) => (a - b).toInt();

  @override
  num get zero => 0;
}

class NumLinearScaleState<D> extends LinearScaleState<num, D> {}

class NumLinearScaleComponent<D>
  extends LinearScaleComponent<NumLinearScaleState<D>, num, D>
{
  NumLinearScaleComponent([NumScale<D> props]) : super(props);

  @override
  NumLinearScaleState<D> get originalState => NumLinearScaleState<D>();

  @override
  int compare(num a, num b) => (a - b).toInt();

  @override
  num add(num a, num b) => a + b;

  @override
  num substarct(num a, num b) => a - b;

  @override
  num multiply(num a, double k) => a * k;

  @override
  double divide(num a, num b) => a / b;

  @override
  num get zero => 0.0;

  @override
  num get one => 1.0;

  @override
  List<num> getAutoTicks() => numAutoTicks(
    minValue: state.min,
    maxValue: state.max,
    minCount: state.tickCount,
    maxCount: state.tickCount,
    interval: state.tickInterval,
  );
}
