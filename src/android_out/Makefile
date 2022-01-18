CXX=${NDK_HOME}/toolchains/llvm/prebuilt/linux-x86_64/bin/armv7a-linux-androideabi21-clang++ -DOS_ANDROID -I../
AR=${NDK_HOME}/toolchains/llvm/prebuilt/linux-x86_64/bin/arm-linux-androideabi-ar
BASE=../base

PROTOBUF_ROOT=../third_party/protobuf
PROTOBUF_CPP_ROOT=${PROTOBUF_ROOT}/src/google/protobuf
#PROTOC=${PROTOBUF_ROOT}/src/protoc
PROTOC=/home/alexander/Development/Misc/mozc/src/third_party/protobuf/src/protoc

PROTOBUF_SOURCES=${PROTOBUF_CPP_ROOT}/any.cc \
${PROTOBUF_CPP_ROOT}/arena.cc \
${PROTOBUF_CPP_ROOT}/arenastring.cc \
${PROTOBUF_CPP_ROOT}/compiler/importer.cc \
${PROTOBUF_CPP_ROOT}/compiler/parser.cc \
${PROTOBUF_CPP_ROOT}/descriptor.cc \
${PROTOBUF_CPP_ROOT}/descriptor.pb.cc \
${PROTOBUF_CPP_ROOT}/descriptor_database.cc \
${PROTOBUF_CPP_ROOT}/dynamic_message.cc \
${PROTOBUF_CPP_ROOT}/extension_set.cc \
${PROTOBUF_CPP_ROOT}/extension_set_heavy.cc \
${PROTOBUF_CPP_ROOT}/generated_message_reflection.cc \
${PROTOBUF_CPP_ROOT}/generated_message_util.cc \
${PROTOBUF_CPP_ROOT}/implicit_weak_message.cc \
${PROTOBUF_CPP_ROOT}/io/coded_stream.cc \
${PROTOBUF_CPP_ROOT}/io/gzip_stream.cc \
${PROTOBUF_CPP_ROOT}/io/printer.cc \
${PROTOBUF_CPP_ROOT}/io/strtod.cc \
${PROTOBUF_CPP_ROOT}/io/tokenizer.cc \
${PROTOBUF_CPP_ROOT}/io/zero_copy_stream.cc \
${PROTOBUF_CPP_ROOT}/io/zero_copy_stream_impl.cc \
${PROTOBUF_CPP_ROOT}/io/zero_copy_stream_impl_lite.cc \
${PROTOBUF_CPP_ROOT}/map_field.cc \
${PROTOBUF_CPP_ROOT}/message.cc \
${PROTOBUF_CPP_ROOT}/message_lite.cc \
${PROTOBUF_CPP_ROOT}/reflection_ops.cc \
${PROTOBUF_CPP_ROOT}/repeated_field.cc \
${PROTOBUF_CPP_ROOT}/service.cc \
${PROTOBUF_CPP_ROOT}/stubs/atomicops_internals_x86_gcc.cc \
${PROTOBUF_CPP_ROOT}/stubs/atomicops_internals_x86_msvc.cc \
${PROTOBUF_CPP_ROOT}/stubs/common.cc \
${PROTOBUF_CPP_ROOT}/stubs/int128.cc \
${PROTOBUF_CPP_ROOT}/stubs/once.cc \
${PROTOBUF_CPP_ROOT}/stubs/status.cc \
${PROTOBUF_CPP_ROOT}/stubs/stringpiece.cc \
${PROTOBUF_CPP_ROOT}/stubs/stringprintf.cc \
${PROTOBUF_CPP_ROOT}/stubs/structurally_valid.cc \
${PROTOBUF_CPP_ROOT}/stubs/strutil.cc \
${PROTOBUF_CPP_ROOT}/stubs/substitute.cc \
${PROTOBUF_CPP_ROOT}/stubs/io_win32.cc \
${PROTOBUF_CPP_ROOT}/text_format.cc \
${PROTOBUF_CPP_ROOT}/unknown_field_set.cc \
${PROTOBUF_CPP_ROOT}/wire_format.cc \
${PROTOBUF_CPP_ROOT}/wire_format_lite.cc

base_input=../base/cpu_stats.cc \
../base/process_mutex.cc \
../base/run_level.cc \
../base/scheduler.cc \
../base/stopwatch.cc \
../base/unnamed_event.cc
base_objects = $(foreach file,${base_input},$(notdir $(patsubst %.cc,%.o,${file})))
base.gyp_base:
	${CXX} -c ${base_input}
	${AR} -rv libbase.a ${base_objects}

base.gyp_jni_proxy:
	${CXX} -c ../base/android_jni_proxy.cc
	${AR} -rv libjni_proxy.a android_jni_proxy.o

base.gyp_mutex:
	${CXX} -c ../base/mutex.cc
	${AR} -rv mutex.a mutex.o

base.gyp_singleton: base.gyp_mutex
	${CXX} -c ../base/singleton.cc
	${AR} -rv singleton.a singleton.o mutex.a

base.gyp_clock: base.gyp_singleton
	${CXX} -c ../base/clock.cc
	${AR} -rv clock.a clock.o singleton.a

base.gyp_flags: base.gyp_flags
	${CXX} -c ../base/flags.cc
	${AR} -rv flags.a flags.o singleton.a

base.gyp_string_piece:
	${CXX} -c ../base/string_piece.cc
	${AR} -rv string_piece.a string_piece.o

base.gyp_hash: base.gyp_string_piece
	${CXX} -c ../base/hash.cc
	${AR} -rv hash.a hash.o string_piece.a

base.gyp_gen_character_set:
	python ../base/gen_character_set.py --cp932file=../data/unicode/CP932.TXT \
		--jisx0201file=../data/unicode/JIS0201.TXT \
		--jisx0208file=../data/unicode/JIS0208.TXT \
		--jisx0212file=../data/unicode/JIS0212.TXT \
		--jisx0213file=../data/unicode/jisx0213-2004-std.txt \
		--output=../base/character_set.inc

base.gyp_gen_version_def:
	PYTHONPATH=${PYTHON_PATH}:../ python ../build_tools/replace_version.py \
		--version_file=../mozc_version.txt \
		--input ../base/version_def_template.h \
		--output ../base/version_def.h \
		--branding Mozc

base.gyp_encryptor: base.gyp_base base.gyp_obfuscator_support
	${CXX} -c ../base/encryptor.cc ../base/password_manager.cc
	${AR} -rv encryptor.a encryptor.o password_manager.o

base.gyp_multifile: base.gyp_base_core
	${CXX} -c ../base/multifile.cc
	${AR} -rv multifile.a multifile.o

config_file_stream_inputs = ../data/keymap/atok.tsv \
../data/keymap/chromeos.tsv \
../data/keymap/kotoeri.tsv \
../data/keymap/mobile.tsv \
../data/keymap/ms-ime.tsv \
../data/preedit/12keys-halfwidthascii.tsv \
../data/preedit/12keys-hiragana.tsv \
../data/preedit/flick-halfwidthascii.tsv \
../data/preedit/flick-hiragana.tsv \
../data/preedit/hiragana-romanji.tsv \
../data/preedit/kana.tsv \
../data/preedit/notouch-hiragana.tsv \
../data/preedit/godan-hiragana.tsv \
../data/preedit/qwerty_mobile-halfwidthascii.tsv \
../data/preedit/qwerty_mobile-hiragana.tsv \
../data/preedit/romanji-hiragana.tsv \
../data/preedit/toggle_flick-halfwidthascii.tsv \
../data/preedit/toggle_flick-hiragana.tsv
base.gyp_gen_config_file_stream_data:
	mkdir ./base; exit 0
	python ../base/gen_config_file_stream_data.py \
		--output ./base/config_file_stream_data.inc \
		${config_file_stream_inputs}

base.gyp_config_file_stream: base.gyp_gen_config_file_stream_data
	${CXX} -I./ -I../third_party/protobuf/src \
		-c ../base/config_file_stream.cc
	${AR} -rv config_file_stream.a config_file_stream.o

base.gyp_base_core: base.gyp_clock base.gyp_flags base.gyp_hash base.gyp_mutex base.gyp_singleton base.gyp_string_piece base.gyp_gen_character_set base.gyp_gen_version_def
	${CXX} -c ../base/file_stream.cc ../base/file_util.cc ../base/init_mozc.cc \
		../base/japanese_util_rule.cc ../base/logging.cc ../base/mmap.cc \
		../base/number_util.cc ../base/system_util.cc ../base/text_normalizer.cc \
		../base/thread.cc ../base/util.cc ../base/version.cc ../base/win_util.cc \
		../base/android_util.cc
	${AR} -rv base_core.a file_stream.o file_util.o init_mozc.o japanese_util_rule.o \
		logging.o mmap.o number_util.o system_util.o text_normalizer.o \
		thread.o util.o version.o win_util.o clock.a flags.a hash.a mutex.a singleton.a \
		string_piece.a android_util.o

base.gyp_serialized_string_array: base.gyp_base_core
	${CXX} -c ../base/serialized_string_array.cc
	${AR} -rv serialized_string_array.a serialized_string_array.o base_core.a

base.gyp_obfuscator_support: base.gyp_base
	${CXX} -c ../base/unverified_aes256.cc ../base/unverified_sha1.cc
	${AR} -rv obfuscator_support.a unverified_aes256.o unverified_aes256.o

PROTOBUF_OBJECTS := $(foreach file, ${PROTOBUF_SOURCES}, $(patsubst %.cc,%.o,$(notdir ${file})))
protobuf.gyp_protobuf:
	${CXX} -I../third_party/protobuf/src \
		-DHAVE_PTHREAD -DGOOGLE_PROTOBUF_NO_RTTI \
		-c ${PROTOBUF_SOURCES}
	${AR} -rv protobuf.a ${PROTOBUF_OBJECTS}

# NOTE: Protoc for 3.4.0
${PROTOC}:
	cd ../third_party/protobuf && \
		./autogen.sh && \
		./configure && \
		make -j8
protocol.gyp_genproto_segmenter_data_proto: ${PROTOC}
	python ../build_tools/protoc_wrapper.py \
		--project_root=../ \
		--protoc_command=${PROTOC} \
		--proto=../protocol/segmenter_data.proto \
		--cpp_out=./ \
		--protoc_dir=$(dir ${PROTOC})

protocol.gyp_genproto_config_proto: ${PROTOC}
	python ../build_tools/protoc_wrapper.py \
		--project_root=../ \
		--protoc_command=${PROTOC} \
		--proto=../protocol/config.proto \
		--cpp_out=./ \
		--protoc_dir=$(dir ${PROTOC})

protocol.gyp_genproto_candidates_proto: ${PROTOC}
	python ../build_tools/protoc_wrapper.py \
		--project_root=../ \
		--protoc_command=${PROTOC} \
		--proto=../protocol/candidates.proto \
		--cpp_out=./ \
		--protoc_dir=$(dir ${PROTOC})

protocol.gyp_genproto_config_proto: ${PROTOC}
	python ../build_tools/protoc_wrapper.py \
		--project_root=../ \
		--protoc_command=${PROTOC} \
		--proto=../protocol/config.proto \
		--cpp_out=./ \
		--protoc_dir=$(dir ${PROTOC})

protocol.gyp_config_proto: protobuf.gyp_protobuf protocol.gyp_genproto_config_proto
	${CXX} -I./ -I../third_party/protobuf/src \
		-c ./protocol/config.pb.cc
	${AR} -rv config.pb.a config.pb.o

protocol.gyp_candidates_proto: protocol.gyp_genproto_candidates_proto
	${CXX} -I./ -I../third_party/protobuf/src \
		-c ./protocol/candidates.pb.cc
	${AR} -rv candidates.pb.a candidates.pb.o

protocol.gyp_genproto_user_dictionary_storage_proto:
	python ../build_tools/protoc_wrapper.py \
		--project_root=../ \
		--protoc_command=${PROTOC} \
		--proto=../protocol/user_dictionary_storage.proto \
		--cpp_out=./ \
		--protoc_dir=$(dir ${PROTOC})

usage_stats_base.gyp_genproto_usage_stats:
	python ../build_tools/protoc_wrapper.py \
		--project_root=../ \
		--protoc_command=${PROTOC} \
		--proto=../usage_stats/usage_stats.proto \
		--cpp_out=./ \
		--protoc_dir=$(dir ${PROTOC})

protocol.gyp_user_dictionary_storage_proto: protocol.gyp_genproto_user_dictionary_storage_proto
	${CXX} -I./ -I../third_party/protobuf/src \
		-c ./protocol/user_dictionary_storage.pb.cc
	${AR} -rv user_dictionary_storage.pb.a user_dictionary_storage.pb.o

protocol.gyp_genproto_engine_builder_proto: ${PROTOC}
	python ../build_tools/protoc_wrapper.py \
		--project_root=../ \
		--protoc_command=${PROTOC} \
		--proto=../protocol/engine_builder.proto \
		--cpp_out=./ \
		--protoc_dir=$(dir ${PROTOC})

protocol.gyp_engine_builder_proto: protocol.gyp_genproto_engine_builder_proto
	${CXX} -I./ -I../third_party/protobuf/src \
		-c ./protocol/engine_builder.pb.cc
	${AR} -rv engine_builder.pb.a engine_builder.pb.o

protocol.gyp_genproto_commands_proto: ${PROTOC}
	python ../build_tools/protoc_wrapper.py \
		--project_root=../ \
		--protoc_command=${PROTOC} \
		--proto=../protocol/commands.proto \
		--cpp_out=./ \
		--protoc_dir=$(dir ${PROTOC})

protocol.gyp_commands_proto: protocol.gyp_genproto_engine_builder_proto protocol.gyp_candidates_proto protocol.gyp_config_proto protocol.gyp_engine_builder_proto protocol.gyp_genproto_commands_proto protocol.gyp_user_dictionary_storage_proto
	${CXX} -I./ -I../third_party/protobuf/src \
		-c ./protocol/commands.pb.cc
	${AR} -rv commands.pb.a commands.pb.o

protocol.gyp_genproto_engine_builder_proto:
	python ../build_tools/protoc_wrapper.py \
		--project_root=../ \
		--protoc_command=${PROTOC} \
		--proto=../protocol/engine_builder.proto \
		--cpp_out=./ \
		--protoc_dir=$(dir ${PROTOC})

protocol.gyp_engine_builder_proto: protocol.gyp_genproto_engine_builder_proto
	${CXX} -I./ -I../third_party/protobuf/src \
		-c ./protocol/engine_builder.pb.cc
	${AR} -rv engine_builder.pb.a engine_builder.pb.o

data_manager.gyp_genproto_dataset_proto: ${PROTOC}
	python ../build_tools/protoc_wrapper.py \
		--project_root=../ \
		--protoc_command=${PROTOC} \
		--proto=../data_manager/dataset.proto \
		--cpp_out=./ \
		--protoc_dir=$(dir ${PROTOC})
data_manager_base.gyp_serialized_dictionary: base.gyp_base base.gyp_serialized_string_array
	${CXX} -I./ -I../third_party/protobuf/src \
		-c ../data_manager/serialized_dictionary.cc
	${AR} -rv serialized_dictionary.a serialized_dictionary.o

data_manager_base.gyp_dataset_reader: base.gyp_base base.gyp_obfuscator_support data_manager_base.gyp_dataset_proto
	${CXX} -I./ -I../third_party/protobuf/src \
		-c ../data_manager/dataset_reader.cc
	${AR} -rv dataset_reader.a dataset_reader.o

data_manager_base.gyp_data_manager: base.gyp_base base.gyp_serialized_string_array protocol.gyp_segmenter_data_proto data_manager_base.gyp_dataset_reader data_manager_base.gyp_serialized_dictionary
	${CXX} -I./ -I../third_party/protobuf/src \
		-c ../data_manager/data_manager.cc
	${AR} -rv data_manager.a data_manager.o

protocol.gyp_segmenter_data_proto: protocol.gyp_genproto_segmenter_data_proto
	${CXX} -I./ -I../third_party/protobuf/src -c ./protocol/segmenter_data.pb.cc
	${AR} -rv segmenter_data.pb.a segmenter_data.pb.o

prediction.gyp_genproto_prediction:
	python ../build_tools/protoc_wrapper.py \
		--project_root=../ \
		--protoc_command=${PROTOC} \
		--proto=../prediction/user_history_predictor.proto \
		--cpp_out=./ \
		--protoc_dir=$(dir ${PROTOC})

prediction.gyp_prediction_protocol: prediction.gyp_genproto_prediction
	${CXX} -I./ -I../third_party/protobuf/src -c ./prediction/user_history_predictor.pb.cc
	${AR} -rv user_history_predictor.pb.a user_history_predictor.pb.o

data_manager_base.gyp_genproto_dataset_proto:
		python ../build_tools/protoc_wrapper.py \
		--project_root=../ \
		--protoc_command=${PROTOC} \
		--proto=../data_manager/dataset.proto \
		--cpp_out=./ \
		--protoc_dir=$(dir ${PROTOC})

data_manager_base.gyp_dataset_proto: data_manager_base.gyp_genproto_dataset_proto
	${CXX} -I./ -I../third_party/protobuf/src -c ./data_manager/dataset.pb.cc
	${AR} -rv dataset.pb.a dataset.pb.o

data_manager.gyp_dataset_proto: data_manager.gyp_genproto_dataset_proto
	${CXX} -I./ -I../third_party/protobuf/src -c ./data_manager/dataset.pb.cc
	${AR} -rv dataset.pb.a dataset.pb.o

data_manager.gyp_dataset_reader: data_manager.gyp_dataset_proto base.gyp_base base.gyp_obfuscator_support
	${CXX} -I./ -I../third_party/protobuf/src \
		-c ../data_manager/dataset_reader.cc
	${AR} -rv dataset_reader.a dataset_reader.o

data_manager.gyp_serialized_dictionary: base.gyp_base base.gyp_serialized_string_array
	${CXX} -c ../data_manager/serialized_dictionary.cc
	${AR} -rv serialized_dictionary.a serialized_dictionary.o

data_manager.gyp_data_manager: base.gyp_base base.gyp_serialized_string_array protocol.gyp_segmenter_data_proto data_manager.gyp_dataset_reader data_manager.gyp_serialized_dictionary
	${CXX} -I./ -I../third_party/protobuf/src \
		-c ../data_manager/data_manager.cc
	${AR} -rv data_manager.a data_manager.o

dictionary_base.gyp_suppression_dictionary: base.gyp_base
	${CXX} -I./ -I../third_party/protobuf/src \
		-c ../dictionary/suppression_dictionary.cc
	${AR} -rv suppression_dictionary.a suppression_dictionary.o

dictionary_base.gyp_text_dictionary_loader: base.gyp_base base.gyp_multifile dictionary_base.gyp_pos_matcher
	${CXX} -I./ -I../third_party/protobuf/src \
		-c ../dictionary/text_dictionary_loader.cc
	${AR} -rv text_dictionary_loader.a text_dictionary_loader.o

dictionary_base.gyp_user_pos: base.gyp_base
	${CXX} -c ../dictionary/user_pos.cc
	${AR} -rv user_pos.a user_pos.o

config.gyp_config_handler: base.gyp_base base.gyp_config_file_stream protocol.gyp_config_proto
	${CXX} -I./ -I../third_party/protobuf/src \
		-c ../config/config_handler.cc
	${AR} -rv config_handler.a config_handler.o

config.gyp_stats_config_util: config.gyp_config_handler protocol.gyp_config_proto
	${CXX} -I./ -I../third_party/protobuf/src \
		-c ../config/stats_config_util.cc
	${AR} -rv stats_config_util.a stats_config_util.o

config.gyp_character_form_manager: config.gyp_config_handler base.gyp_base base.gyp_config_file_stream protocol.gyp_config_proto storage.gyp_storage
	${CXX} -I./ -I../third_party/protobuf/src \
		-c ../config/character_form_manager.cc
	${AR} -rv character_form_manager.a character_form_manager.o

storage_input = ../storage/encrypted_string_storage.cc \
../storage/existence_filter.cc \
../storage/lru_storage.cc \
../storage/memory_storage.cc \
../storage/registry.cc \
../storage/tiny_storage.cc
storage_objects := $(foreach file,${storage_input},$(notdir $(patsubst %.cc,%.o, ${file})))
storage.gyp_storage: base.gyp_base base.gyp_encryptor
	${CXX} -c ${storage_input}
	${AR} -rv storage.a ${storage_objects}

usage_stats_base.gyp_gen_usage_stats_list:
	python ../build_tools/redirect.py \
		./usage_stats/usage_stats_list.h \
		../usage_stats/gen_stats_list.py \
		../data/usage_stats/stats.def

usage_stats_base.gyp_usage_stats_protocol: usage_stats_base.gyp_genproto_usage_stats
	${CXX} -I./ -I../third_party/protobuf/src \
		-c ./usage_stats/usage_stats.pb.cc
	${AR} -rv usage_stats.pb.a usage_stats.pb.o

usage_stats_base.gyp_usage_stats: base.gyp_base config.gyp_stats_config_util storage.gyp_storage usage_stats_base.gyp_gen_usage_stats_list usage_stats_base.gyp_usage_stats_protocol
	${CXX} -I./ -I../third_party/protobuf/src \
		-c ../usage_stats/usage_stats.cc
	${AR} -rv usage_stats.a usage_stats.o

dictionary_base.gyp_gen_pos_map:
	mkdir ./dictionary; exit 0
	PYTHONPATH=${PYTHON_PATH}:../ python ../dictionary/gen_pos_map.py \
		--user_pos_file=../data/rules/user_pos.def \
		--third_party_pos_map_file=../data/rules/third_party_pos_map.def \
		--output=./dictionary/pos_map.inc

# TODO: ???
dictionary_base.gyp_pos_util:
	python ../build_tools/code_generator_util.py
	PYTHONPATH=${PYTHON_PATH}:../ python ../dictionary/pos_util.py

dictionary_base.gyp_gen_pos_matcher: dictionary_base.gyp_pos_util
	mkdir dictionary; exit 0
	PYTHONPATH=${PYTHON_PATH}:../ python ../dictionary/gen_pos_matcher_code.py \
		--pos_matcher_rule_file=../data/rules/pos_matcher_rule.def \
		--output_pos_matcher_h=./dictionary/pos_matcher.h

dictionary_base.gyp_pos_matcher: dictionary_base.gyp_gen_pos_matcher

user_dictionary_input= ../dictionary/user_dictionary.cc \
../dictionary/user_dictionary_importer.cc \
../dictionary/user_dictionary_session.cc \
../dictionary/user_dictionary_session_handler.cc \
../dictionary/user_dictionary_storage.cc \
../dictionary/user_dictionary_util.cc
user_dictionary_objects := $(foreach file,${user_dictionary_input},$(notdir $(patsubst %.cc,%.o, ${file})))
dictionary_base.gyp_user_dictionary: base.gyp_base base.gyp_config_file_stream config.gyp_config_handler protocol.gyp_config_proto protocol.gyp_user_dictionary_storage_proto usage_stats_base.gyp_usage_stats dictionary_base.gyp_gen_pos_matcher dictionary_base.gyp_pos_matcher dictionary_base.gyp_suppression_dictionary dictionary_base.gyp_gen_pos_map
	${CXX} -I./ -I../third_party/protobuf/src \
		-c ${user_dictionary_input}
	${AR} -rv user_dictionary.a ${user_dictionary_objects}

dictionary.gyp_dictionary_impl: base.gyp_base config.gyp_config_handler protocol.gyp_commands_proto protocol.gyp_config_proto protocol.gyp_user_dictionary_storage_proto dictionary_base.gyp_pos_matcher dictionary_base.gyp_suppression_dictionary
	${CXX} -I./ -I../third_party/protobuf/src \
		-c ../dictionary/dictionary_impl.cc
	${AR} -rv dictionary_impl.a dictionary_impl.o

dictionary.gyp_suffix_dictionary: base.gyp_base base.gyp_serialized_string_array
	${CXX} -c ../dictionary/suffix_dictionary.cc
	${AR} -rv suffix_dictionary.a suffix_dictionary.o

request.gyp_conversion_request: base.gyp_base config.gyp_config_handler protocol.gyp_commands_proto protocol.gyp_config_proto
	${CXX} -I./ -I../third_party/protobuf/src \
		-c ../request/conversion_request.cc
	${AR} -rv conversion_request.a conversion_request.o

louds.gyp_simple_succinct_bit_vector_array: base.gyp_base
	${CXX} -c ../storage/louds/simple_succinct_bit_vector_index.cc
	${AR} -rv simple_succinct_bit_vector_index.a simple_succinct_bit_vector_index.o

louds.gyp_bit_vector_based_array: louds.gyp_simple_succinct_bit_vector_array base.gyp_base
	${CXX} -c ../storage/louds/bit_vector_based_array.cc
	${AR} -rv bit_vector_based_array.a bit_vector_based_array.o

louds.gyp_simple_succinct_bit_vector_index: base.gyp_base
	${CXX} -c ../storage/louds/simple_succinct_bit_vector_index.cc
	${AR} -rv simple_succinct_bit_vector_index.a simple_succinct_bit_vector_index.o

louds.gyp_louds: base.gyp_base louds.gyp_simple_succinct_bit_vector_index
	${CXX} -c ../storage/louds/louds.cc
	${AR} -rv louds.a louds.o

louds.gyp_louds_trie: base.gyp_base louds.gyp_louds louds.gyp_simple_succinct_bit_vector_index
	${CXX} -c ../storage/louds/louds_trie.cc
	${AR} -rv louds_trie.a louds_trie.o

dictionary_file.gyp_codec_util: base.gyp_base_core
	${CXX} -c ../dictionary/file/codec_util.cc
	${AR} -rv codec_util.a codec_util.o

dictionary_file.gyp_codec: dictionary_file.gyp_codec_util base.gyp_base_core
	${CXX} -c ../dictionary/file/codec.cc
	${AR} -rv codec.a codec.o

dictionary_file.gyp_codec_factory: dictionary_file.gyp_codec dictionary_file.gyp_codec_util base.gyp_base_core
	${CXX} -c ../dictionary/file/codec_factory.cc
	${AR} -rv codec_factory.a codec_factory.o

dictionary_file.gyp_dictionary_file: base.gyp_base_core
	${CXX} -c ../dictionary/file/dictionary_file.cc
	${AR} -rv dictionary_file.a dictionary_file.o

system_dictionary.gyp_system_dictionary_codec: base.gyp_base_core
	${CXX} -c ../dictionary/system/codec.cc -o system_dictionary_codec.o
	${AR} -rv system_dictionary_codec.a system_dictionary_codec.o

system_dictionary.gyp_system_dictionary: base.gyp_base_core request.gyp_conversion_request louds.gyp_bit_vector_based_array dictionary_base.gyp_text_dictionary_loader dictionary_file.gyp_codec_factory dictionary_file.gyp_dictionary_file system_dictionary.gyp_system_dictionary_codec
	${CXX} -c ../dictionary/system/system_dictionary.cc
	${AR} -rv system_dictionary.a system_dictionary.o

system_dictionary.gyp_value_dictionary: base.gyp_base_core louds.gyp_louds_trie dictionary_base.gyp_pos_matcher dictionary_file.gyp_codec_factory system_dictionary.gyp_system_dictionary_codec
	${CXX} -I./ -I../third_party/protobuf/src \
		-c ../dictionary/system/value_dictionary.cc
	${AR} -rv value_dictionary.a value_dictionary.o

dictionary.gyp_dictionary: base.gyp_base_core config.gyp_config_handler protocol.gyp_commands_proto protocol.gyp_config_proto protocol.gyp_user_dictionary_storage_proto dictionary_base.gyp_pos_matcher dictionary_base.gyp_suppression_dictionary

composer.gyp_key_event_util: base.gyp_base protocol.gyp_commands_proto
	${CXX} -I./ -I../third_party/protobuf/src \
		-c ../composer/key_event_util.cc
	${AR} -rv key_event_util.a key_event_util.o

composer.gyp_key_parser: base.gyp_base protocol.gyp_config_proto protocol.gyp_commands_proto
	${CXX} -I./ -I../third_party/protobuf/src \
		-c ../composer/key_parser.cc
	${AR} -rv key_parser.a key_parser.o

composer_input=../composer/composer.cc \
../composer/internal/char_chunk.cc \
../composer/internal/composition.cc \
../composer/internal/composition_input.cc \
../composer/internal/converter.cc \
../composer/internal/mode_switching_handler.cc \
../composer/internal/transliterators.cc \
../composer/internal/typing_corrector.cc \
../composer/internal/typing_model.cc \
../composer/table.cc
composer_objects := $(foreach file,${composer_input},$(notdir $(patsubst %.cc,%.o,${file})))
composer.gyp_composer: base.gyp_base base.gyp_config_file_stream composer.gyp_key_event_util composer.gyp_key_parser config.gyp_character_form_manager config.gyp_config_handler protocol.gyp_config_proto protocol.gyp_commands_proto transliteration.gyp_transliteration
	${CXX} -I./ -I../third_party/protobuf/src \
		-c ${composer_input}
	${AR} -rv composer.a ${composer_objects}

transliteration.gyp_transliteration: base.gyp_base
	${CXX} -c ../transliteration/transliteration.cc
	${AR} -rv transliteration.a transliteration.o

rewriter_base.gyp_gen_rewriter_files: dictionary_base.gyp_pos_util

rewriter_input=../rewriter/calculator_rewriter.cc \
../rewriter/collocation_rewriter.cc \
../rewriter/collocation_util.cc \
../rewriter/correction_rewriter.cc \
../rewriter/command_rewriter.cc \
../rewriter/date_rewriter.cc \
../rewriter/dice_rewriter.cc \
../rewriter/dictionary_generator.cc \
../rewriter/emoji_rewriter.cc \
../rewriter/emoticon_rewriter.cc \
../rewriter/english_variants_rewriter.cc \
../rewriter/focus_candidate_rewriter.cc \
../rewriter/fortune_rewriter.cc \
../rewriter/katakana_promotion_rewriter.cc \
../rewriter/language_aware_rewriter.cc \
../rewriter/normalization_rewriter.cc \
../rewriter/number_compound_util.cc \
../rewriter/number_rewriter.cc \
../rewriter/remove_redundant_candidate_rewriter.cc \
../rewriter/rewriter.cc \
../rewriter/single_kanji_rewriter.cc \
../rewriter/symbol_rewriter.cc \
../rewriter/transliteration_rewriter.cc \
../rewriter/unicode_rewriter.cc \
../rewriter/user_boundary_history_rewriter.cc \
../rewriter/user_dictionary_rewriter.cc \
../rewriter/user_segment_history_rewriter.cc \
../rewriter/variants_rewriter.cc \
../rewriter/version_rewriter.cc \
../rewriter/zipcode_rewriter.cc
rewriter_objects := $(foreach file,${rewriter_input},$(notdir $(patsubst %.cc,%.o,${file})))
rewriter.gyp_rewriter: base.gyp_base base.gyp_config_file_stream base.gyp_serialized_string_array composer.gyp_composer config.gyp_character_form_manager config.gyp_config_handler converter_base.gyp_immutable_converter data_manager_base.gyp_serialized_dictionary dictionary.gyp_dictionary dictionary_base.gyp_pos_matcher protocol.gyp_commands_proto protocol.gyp_config_proto request.gyp_conversion_request storage.gyp_storage usage_stats_base.gyp_usage_stats calculator.gyp_calculator rewriter_base.gyp_gen_rewriter_files
	${CXX} -I./ -I../third_party/protobuf/src \
		-c ${rewriter_input}
	${AR} -rv rewriter.a ${rewriter_objects}


converter_base.gyp_connector: base.gyp_base louds.gyp_simple_succinct_bit_vector_index
	${CXX} -c ../converter/connector.cc
	${AR} -rv connector.a connector.o

converter_base.gyp_segmenter: base.gyp_base
	${CXX} -c ../converter/segmenter.cc
	${AR} -rv segmenter.a segmenter.o

converter_base.gyp_lattice: base.gyp_base
	${CXX} -c ../converter/lattice.cc
	${AR} -rv lattice.a lattice.o

converter_base.gyp_segments: base.gyp_base dictionary_base.gyp_pos_matcher prediction_base.gyp_suggestion_filter transliteration.gyp_transliteration converter_base.gyp_connector converter_base.gyp_lattice converter_base.gyp_segmenter
	${CXX} -I./ -I../third_party/protobuf/src \
		-c ../converter/candidate_filter.cc ../converter/nbest_generator.cc \
		../converter/segments.cc
	${AR} -rv segments.a candidate_filter.o nbest_generator.o segments.o

converter_base.gyp_immutable_converter_interface: request.gyp_conversion_request
	${CXX} -c ../converter/immutable_converter_interface.cc
	${AR} -rv immutable_converter_interface.a immutable_converter_interface.o

converter_base.gyp_immutable_converter: base.gyp_base config.gyp_config_handler dictionary.gyp_suffix_dictionary dictionary_base.gyp_pos_matcher dictionary_base.gyp_suppression_dictionary protocol.gyp_commands_proto protocol.gyp_config_proto rewriter_base.gyp_gen_rewriter_files converter_base.gyp_connector converter_base.gyp_immutable_converter_interface converter_base.gyp_segmenter converter_base.gyp_segments
	${CXX} -I./ -I../third_party/protobuf/src \
		-c ../converter/immutable_converter.cc ../converter/key_corrector.cc
	${AR} -rv immutable_converter.a immutable_converter.o key_corrector.o

prediction_base.gyp_suggestion_filter: base.gyp_base storage.gyp_storage
	${CXX} -c ../prediction/suggestion_filter.cc
	${AR} -rv suggestion_filter.a suggestion_filter.o

calculator.gyp_calculator: base.gyp_base
	${CXX} -c ../rewriter/calculator/calculator.cc
	${AR} -rv calculator.a calculator.o

session_base.gyp_request_test_until: protocol.gyp_commands_proto protocol.gyp_config_proto
	${CXX} -I./ -I../third_party/protobuf/src \
		-c ../session/request_test_util.cc
	${AR} -rv request_test_util.a request_test_util.o

session_base.gyp_keymap: base.gyp_base composer.gyp_key_event_util composer.gyp_key_parser config.gyp_config_handler protocol.gyp_commands_proto protocol.gyp_config_proto
	${CXX} -I./ -I../third_party/protobuf/src \
		-c ../session/internal/keymap.cc
	${AR} -rv keymap.a keymap.o

session_base.gyp_keymap_factory: base.gyp_base protocol.gyp_commands_proto protocol.gyp_config_proto
	${CXX} -I./ -I../third_party/protobuf/src \
		-c ../session/internal/keymap_factory.cc
	${AR} -rv keymap_factory.a keymap_factory.o

session_base.gyp_session_usage_stats_util: base.gyp_base base.gyp_config_file_stream protocol.gyp_commands_proto storage.gyp_storage
	${CXX} -I./ -I../third_party/protobuf/src \
		-c ../session/session_usage_stats_util.cc
	${AR} -rv session_usage_stats_util.a session_usage_stats_util.o

session.gyp_session_internal: base.gyp_base composer.gyp_composer config.gyp_config_handler protocol.gyp_commands_proto protocol.gyp_config_proto
	${CXX} -I./ -I../third_party/protobuf/src \
		-c ../session/internal/candidate_list.cc \
		../session/internal/ime_context.cc \
		../session/internal/session_output.cc \
		../session/internal/key_event_transformer.cc
	${AR} -rv session_internal.a candidate_list.o ime_context.o session_output.o key_event_transformer.o

session.gyp_session_handler: composer.gyp_composer config.gyp_character_form_manager config.gyp_config_handler dictionary_base.gyp_user_dictionary engine.gyp_engine_factory protocol.gyp_commands_proto protol.gyp_config_proto protocol.gyp_engine_builder_proto protocol.gyp_user_dictionary_storage_proto session_base.gyp_generic_storage_manager
	${CXX} -I./ -I../third_party/protobuf/src \
		-c ../session/session_handler.cc \
		../session/session_observer_handler.cc
	${AR} -rv session_handler.a session_handler.o session_handler.o

session.gyp_session_usage_observer: base.gyp_base config.gyp_stats_config_util protocol.gyp_state_proto usage_stats_base.gyp_usage_stats usage_stats_base.gyp_usage_stats_protocol
	${CXX} -I./ -I../third_party/protobuf/src \
		-c ../session/session_usage_observer.cc
	${AR} -rv session_usage_observer.a session_usage_observer.o

converter_base.gyp_converter_util: converter_base.gyp_segments
	${CXX} -I./ -I../third_party/protobuf/src \
		-c ../converter/converter_util.cc
	${AR} -rv converter_util.a converter_util.o

session.gyp_session: base.gyp_base composer.gyp_key_parser config.gyp_config_handler converter_base.gyp_converter_util protocol.gyp_commands_proto protocol.gyp_config_proto request.gyp_conversion_request transliteration.gyp_transliteration usage_stats_base.gyp_usage_stats session_base.gyp_keymap session_base.gyp_keymap_factory session_base.gyp_session_usage_stats_util session.gyp_session_internal
	${CXX} -I./ -I../third_party/protobuf/src \
		-c ../session/session.cc \
		../session/session_converter.cc
	${AR} -rv session.a session.o session_converter.o

usage_stats.gyp_usage_stats_uploader: base.gyp_base base.gyp_config_file_stream base.gyp_encryptor config.gyp_config_handler config.gyp_stats_config_util net.gyp_http_client protocol.gyp_config_proto session_base.gyp_keymap storage.gyp_storage usage_stats_base.gyp_gen_usage_stats_list usage_stats_base.gyp_usage_stats usage_stats_base.gyp_usage_stats_protocol
	${CXX} -I./ -I../third_party/protobuf/src \
		-c ../usage_stats/upload_util.cc \
		../usage_stats/usage_stats_uploader.cc \
		../usage_stats/usage_stats_updater.cc
	${AR} -rv usage_stats_uploader.a upload_util.o usage_stats_uploader.o usage_stats_updater.o

net.gyp_http_client: base.gyp_base
	${CXX} -I./ -I../third_party/protobuf/src \
		-c ../net/http_client.cc \
		../net/proxy_manager.cc
	${AR} -rv http_client.a http_client.o proxy_manager.o

prediction.gyp_prediction: base.gyp_base base.gyp_config_file_stream composer.gyp_composer config.gyp_config_handler converter_base.gyp_immutable_converter converter_base.gyp_segmenter converter_base.gyp_segments dictionary.gyp_dictionary dictionary.gyp_suffix_dictionary dictionary_base.gyp_suppression_dictionary protocol.gyp_commands_proto request.gyp_conversion_request rewriter.gyp_rewriter session_base.gyp_request_test_until storage.gyp_storage usage_stats_base.gyp_usage_stats prediction_base.gyp_suggestion_filter prediction.gyp_prediction_protocol
	${CXX} -I./ -I../third_party/protobuf/src \
		-c ../prediction/dictionary_predictor.cc ../prediction/predictor.cc \
		../prediction/user_history_predictor.cc
	${AR} -rv prediction.a dictionary_predictor.o predictor.o user_history_predictor.o

converter.gyp_converter: composer.gyp_composer dictionary_base.gyp_pos_matcher prediction.gyp_prediction prediction.gyp_prediction_protocol protocol.gyp_commands_proto request.gyp_conversion_request rewriter.gyp_rewriter usage_stats_base.gyp_usage_stats converter_base.gyp_immutable_converter converter_base.gyp_immutable_converter_interface converter_base.gyp_segmenter converter_base.gyp_segments
	${CXX} -I./ -I../third_party/protobuf/src \
		-c ../converter/converter.cc
	${AR} -rv converter.a converter.o

engine.gyp_engine: base.gyp_base converter.gyp_converter converter_base.gyp_connector converter_base.gyp_segmenter dictionary.gyp_dictionary_impl dictionary.gyp_suffix_dictionary dictionary_base.gyp_pos_matcher dictionary_base.gyp_suppression_dictionary dictionary_base.gyp_user_dictionary dictionary_base.gyp_user_pos system_dictionary.gyp_system_dictionary system_dictionary.gyp_value_dictionary prediction.gyp_prediction prediction_base.gyp_suggestion_filter protocol.gyp_commands_proto protocol.gyp_user_dictionary_storage_proto rewriter.gyp_rewriter
	${CXX} -I./ -I../third_party/protobuf/src \
		-c ../engine/engine.cc
	${AR} -rv engine.a engine.o

engine.gyp_engine_builder: base.gyp_base data_manager_base.gyp_data_manager protocol.gyp_engine_builder_proto
	${CXX} -I./ -I../third_party/protobuf/src \
		-c ../engine/engine_builder.cc
	${AR} -rv engine_builder.a engine_builder.o

engine.gyp_minimal_engine: composer.gyp_composer converter.gyp_converter data_manager_base.gyp_data_manager dictionary_base.gyp_suppression_dictionary protocol.gyp_config_proto request.gyp_conversion_request
	${CXX} -I./ -I../third_party/protobuf/src \
		-c ../engine/minimal_engine.cc
	${AR} -rv minimal_engine.a minimal_engine.o

engine.gyp_oss_engine_factory: base.gyp_base prediction.gyp_prediction engine.gyp_engine oss_data_manager.gyp_oss_data_manager

engine.gyp_engine_factory: engine.gyp_oss_engine_factory

android: base.gyp_base base.gyp_jni_proxy data_manager_base.gyp_data_manager dictionary.gyp_dictionary engine.gyp_engine engine.gyp_engine_builder engine.gyp_minimal_engine session.gyp_session session.gyp_session_handler session.gyp_session_usage_observer usage_stats.gyp_usage_stats_uploader
