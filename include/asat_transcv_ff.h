/* -*- c++ -*- */
/* 
 * Copyright 2012 <+YOU OR YOUR COMPANY+>.
 * 
 * This is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3, or (at your option)
 * any later version.
 * 
 * This software is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this software; see the file COPYING.  If not, write to
 * the Free Software Foundation, Inc., 51 Franklin Street,
 * Boston, MA 02110-1301, USA.
 */

#ifndef INCLUDED_ASAT_TRANSCV_FF_H
#define INCLUDED_ASAT_TRANSCV_FF_H

#include <asat_api.h>
#include <gr_sync_block.h>
#include <uhd/usrp/multi_usrp.hpp>

// includes for list of functions below
#include <uhd/types/time_spec.hpp>
#include <uhd/types/stream_cmd.hpp>
#include <uhd/types/dict.hpp>
#include <uhd/types/ranges.hpp>
#include <uhd/types/tune_result.hpp>
#include <uhd/types/tune_request.hpp>
#include <uhd/types/sensors.hpp>
#include <uhd/types/clock_config.hpp>
#include <uhd/usrp/dboard_iface.hpp>

class asat_transcv_ff;

// Make a new USRP transceiver block

ASAT_API boost::shared_ptr<asat_transcv_ff> asat_make_transcv_ff(
    const uhd::device_addr_t &device_addr,
    const uhd::io_type_t &io_type,
    size_t num_channels
);

ASAT_API boost::shared_ptr<asat_transcv_ff> asat_make_transcv_ff(
    const uhd::device_addr_t &device_addr,
    const uhd::stream_args_t &stream_args
);

class ASAT_API asat_transcv_ff : virtual public gr_sync_block{
public:

    virtual void set_start_time(const uhd::time_spec_t &time) = 0;
//    set start time for incoming samples; immediately for single-channel case, after delay for multichannel
//    &time is the absolute time for reception to begin

    virtual void issue_stream_cmd(const uhd::stream_cmd_t &cmd) = 0;
//    issue a stream command to all channels in source block
//    ONCE STREAMING HAS STARTED, CALL stop() ON THIS BLOCK FIRST, THEN USE THIS BLOCK TO ISSUE ANY COMMAND

    virtual uhd::dict<std::string, std::string> get_usrp_info(size_t chan = 0) = 0;
//    use to get identifying info from USRP
//    returns motherboard ID, name, and serial
//    returns daughterboard RX ID, subdev name and spec, serial, and antenna
//    channel index from 0 to N-1

    virtual void set_subdev_spec(const std::string &spec, size_t mboard = 0) = 0;
//    use to SET the RF frontend specification
//    "spec" sets the subdev spec markup string
//    "mboard" sets the motherboard index, from 0 to M-1

    virtual std::string get_subdev_spec(size_t mboard = 0) = 0;
//    use to GET the RF frontend specification
//    "mboard" gets the motherboard index in use, from 0 to M-1

    virtual void set_samp_rate(double rate) = 0;
//    sets the USRP device sample rate (in Sps)

    virtual double get_samp_rate(void) = 0;
//    gets the actual device sample rate (in Sps), can differ from set value

    virtual uhd::meta_range_t get_samp_rates(void) = 0;
//    get the possible range of device sample rates (in Sps)

    virtual uhd::tune_result_t set_center_freq(const uhd::tune_request_t tune_request, size_t chan = 0) = 0;
//    Tunes the USRP to the desired center frequency
//    "tune_request" contains the tune instructions
//    "chan" is the channel to tune, from 0 to N-1

    uhd::tune_result_t set_center_freq(double freq, size_t chan = 0){
        return set_center_freq(uhd::tune_request_t(freq), chan);
    }
//     wrapper around set_center_freq virtual function above to allow passing single frequency through swig

    virtual double get_center_freq(size_t chan = 0) = 0;
//    get the set center frequency in Hz
//    "chan" is the channel between 0 and N-1

    virtual uhd::freq_range_t get_freq_range(size_t chan = 0) = 0;
//    get the range of tunable frequencies in Hz
//    "chan is the channel between 0 and N-1

    virtual void set_gain(double gain, size_t chan = 0) = 0;
//    set the gain of the daughterboard, gain in dB

    virtual void set_gain(double gain, const std::string &name, size_t chan = 0) = 0;
//    set the named gain for the daughterboard, gain in dB
//    "name" is the name of the gain stage

    virtual double get_gain(size_t chan = 0) = 0;
//    GET the actual gain setting for the daughterboard, gain in dB

    virtual double get_gain(const std::string &name, size_t chan = 0) = 0;
//    GET the named gain for the gain stage

    virtual std::vector<std::string> get_gain_names(size_t chan = 0) = 0;
//    same as above?

    virtual uhd::gain_range_t get_gain_range(size_t chan = 0) = 0;
//    get the settable gain range

    virtual uhd::gain_range_t get_gain_range(const std::string &name, size_t chan = 0) = 0;
//    get the settable gain range

    virtual void set_antenna(const std::string &ant, size_t chan = 0) = 0;
//    set the antenna to use

    virtual std::string get_antenna(size_t chan = 0) = 0;
//    get the antenna in use

    virtual std::vector<std::string> get_antennas(size_t chan = 0) = 0;
//    get a list of all possible antennas

    virtual void set_bandwidth(double bandwidth, size_t chan = 0) = 0;
//    set the value of bandwidth for the bandpass filter on the RF frontend, bandwidth in Hz

    virtual void set_auto_dc_offset(const bool enb, size_t chan = 0) = 0;
//    enable/disable the auto-DC offset correction function

    virtual void set_dc_offset(const std::complex<double> &offset, size_t chan = 0) = 0;
//    set a constand DC offset value. the value is complex, can offset both I and Q components
//    NOTE: ONLY USE WHEN AUTO DC OFFSET CORRECTION IS DIABLED USING ABOVE FUNCTION

    virtual void set_iq_balance(const std::complex<double> &correction, size_t chan = 0) = 0;
//    sets the RF front end IQ imbalance correction, USE TO ADJUST MAGNITUDE AND PHASE OF I AND Q

    virtual uhd::sensor_value_t get_sensor(const std::string &name, size_t chan = 0) = 0;
//    get value from RF frontend sensor

    virtual std::vector<std::string> get_sensor_names(size_t chan = 0) = 0;
//    get a list of frontend sensor names
    uhd::sensor_value_t get_dboard_sensor(const std::string &name, size_t chan = 0){
        return this->get_sensor(name, chan);
    }

    std::vector<std::string> get_dboard_sensor_names(size_t chan = 0){
        return this->get_sensor_names(chan);
    }
//    depreciated functions

    virtual uhd::sensor_value_t get_mboard_sensor(const std::string &name, size_t mboard = 0) = 0;
//    get a motherboard sensor value

    virtual std::vector<std::string> get_mboard_sensor_names(size_t mboard = 0) = 0;
//    get a list of motherboard sensor names

    virtual void set_clock_config(const uhd::clock_config_t &clock_config, size_t mboard = 0) = 0;
//    set the clock configuration

    virtual void set_time_source(const std::string &source, const size_t mboard = 0) = 0;
//    set the time source for the usrp device

    virtual std::string get_time_source(const size_t mboard) = 0;
//    get the time source currently being used by usrp device

    virtual std::vector<std::string> get_time_sources(const size_t mboard) = 0;
//    get a list of possible time sources

    virtual void set_clock_source(const std::string &source, const size_t mboard = 0) = 0;
//    set the clock source for the USRP device, use to set to 10MHz external clock

    virtual std::string get_clock_source(const size_t mboard) = 0;
//    get the current clock source being used by the USRP device

    virtual std::vector<std::string> get_clock_sources(const size_t mboard) = 0;
//    get a list of all possible clock sources

    virtual double get_clock_rate(size_t mboard = 0) = 0;
//    get the master clock rate of the device

    virtual void set_clock_rate(double rate, size_t mboard = 0) = 0;
//    set the master clock rate of the device

    virtual uhd::time_spec_t get_time_now(size_t mboard = 0) = 0;
//    get the current time registers. returns the current USRP time

    virtual uhd::time_spec_t get_time_last_pps(size_t mboard = 0) = 0;
//    get the time the last pps pulse occured. returns the current USRP time

    virtual void set_time_now(const uhd::time_spec_t &time_spec, size_t mboard = 0) = 0;
//    sets the time registers immediately. "&time_spec" is the new time.

    virtual void set_time_next_pps(const uhd::time_spec_t &time_spec) = 0;
//    sets the time registers at the next pps

    virtual void set_time_unknown_pps(const uhd::time_spec_t &time_spec) = 0;
//    sets the time registers with an unknown pps edge

    virtual void set_command_time(const uhd::time_spec_t &time_spec, size_t mboard = 0) = 0;
//    sets the time at which control commands will take effect
//    timed commands will back-pressure all subsequent timed commands, assuming subsequent commands occur within time window
//    if the time spec is late, command will be activated on arrival

    virtual void clear_command_time(size_t mboard = 0) = 0;
//    clears the command time, so all future commands are sent ASAP

    virtual uhd::usrp::dboard_iface::sptr get_dboard_iface(size_t chan = 0) = 0;
//    get access to the underlying uhd daughterboard interface object
//    returns the dboard_iface object
 
    virtual uhd::usrp::multi_usrp::sptr get_device(void) = 0;
//    get access to the underlying uhd device object
//    returns the multi usrp device object

    virtual void set_user_register(const uint8_t addr, const uint32_t data, size_t mboard = 0) = 0;
//    write to the user configuration register bus
//    only exists if user implements custom setting registers in FPGA

	~asat_transcv_ff (); //public destructor


  int work (int noutput_items,
		    gr_vector_const_void_star &input_items,
		    gr_vector_void_star &output_items);
};

#endif /* INCLUDED_ASAT_TRANSCV_FF_H */
