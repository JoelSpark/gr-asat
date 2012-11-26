/* -*- c++ -*- */

#define ASAT_API

//suppress 319. No access specifier given for base class name (ignored).  <-- COPIED FROM UHD_SWIG.I
#pragma SWIG nowarn=319

// STANDARD INCLUDES

%include "gnuradio.i"


// BLOCK HEADERS

%{
#include "asat_transcv_ff.h"
%}

// USED TYPES

%template(string_vector_t) std::vector<std::string>;

%template(size_vector_t) std::vector<size_t>;

%include <uhd/config.hpp>

%include <uhd/utils/pimpl.hpp> //             <-- NOT ACTUALLY USED IN CODE, COPIED FROM UHD_SWIG.I

%ignore uhd::dict::operator[]; //ignore warnings about %extend
%include <uhd/types/dict.hpp>
%template(string_string_dict_t) uhd::dict<std::string, std::string>; //define after dict

%include <uhd/types/device_addr.hpp>

%include <uhd/types/io_type.hpp>

%template(range_vector_t) std::vector<uhd::range_t>; //define before range
%include <uhd/types/ranges.hpp>

%include <uhd/types/tune_request.hpp>

%include <uhd/types/tune_result.hpp>

%include <uhd/types/io_type.hpp>

%include <uhd/types/time_spec.hpp>

%include <uhd/types/stream_cmd.hpp>

%include <uhd/types/clock_config.hpp>

%include <uhd/types/metadata.hpp>

%template(device_addr_vector_t) std::vector<uhd::device_addr_t>;

%include <uhd/types/sensors.hpp>

// SWIG DBOARD_IFACE FOR PYTHON ACCESS
%include stdint.i
%include <uhd/types/serial.hpp>
%template(byte_vector_t) std::vector<uint8_t>;
%include <uhd/usrp/dboard_iface.hpp>
%template(dboard_iface_sptr) boost::shared_ptr<uhd::usrp::dboard_iface>;

// BLOCK MAGIC

GR_SWIG_BLOCK_MAGIC(asat,transcv_ff);
%include "asat_transcv_ff.h"

// DEVICE DISCOVERY, (NO NEED FOR DEVICE.HPP)

%{
static uhd::device_addrs_t find_devices_raw(const uhd::device_addr_t &dev_addr = uhd::device_addr_t()){
    return uhd::device::find(dev_addr);
}
%}

static uhd::device_addrs_t find_devices_raw(const uhd::device_addr_t &dev_addr = uhd::device_addr_t());


// HELPFUL CONSTRAINTS

%{
static const size_t ALL_MBOARDS = uhd::usrp::multi_usrp::ALL_MBOARDS;
%}
static const size_t ALL_MBOARDS;

%{
#include <uhd/version.hpp>
std::string get_version_string(void){
    return uhd::get_version_string();
}
%}
std::string get_version_string(void);


// OTHER (FROM GR_MODTOOL TEMPLATE)

#if SWIGGUILE
%scheme %{
(load-extension-global "libguile-gnuradio-asat_swig" "scm_init_gnuradio_asat_swig_module")
%}

%goops %{
(use-modules (gnuradio gnuradio_core_runtime))
%}
#endif